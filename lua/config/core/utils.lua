-- Format buffer on save
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp", { clear = true }),
  callback = function(args)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = args.buf,
      callback = function()
        vim.lsp.buf.format { async = false, id = args.data.client_id }
      end,
    })
  end
})

-- Trigger autoread when files change on disk
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  command = "checktime"
})

-- Notify when a file was reloaded
vim.api.nvim_create_autocmd("FileChangedShellPost", {
  callback = function()
    -- vim.notify("File changed on disk → buffer reloaded", vim.log.levels.INFO)
    vim.api.nvim_echo(
      { { "File changed on disk → buffer reloaded", "WarningMsg" } },
      false,
      {}
    )
  end
})

local function switch_to_term_or_open()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(buf)
        and vim.api.nvim_buf_get_option(buf, "buflisted")
    then
      local name = vim.api.nvim_buf_get_name(buf)
      -- If you name your terminal buffers like "term:foo"
      if name:match("^term:") then
        vim.api.nvim_set_current_buf(buf)
        return
      end
    end
  end

  -- No matching buffer → open a new terminal in current window
  vim.cmd("terminal")
end

vim.keymap.set("n", "<leader>ty", switch_to_term_or_open, {
  desc = "Switch to or open terminal in this window",
})

local function PrintAndWriteToClipboard(str)
  print(str)
  vim.fn.setreg('+', str)
  return str
end

vim.keymap.set("n", "<leader>br", function()
  PrintAndWriteToClipboard(vim.fn.expand('%'))
end, { desc = "Copy buffer relative path to clipboard", })

vim.keymap.set("n", "<leader>bp", function()
  PrintAndWriteToClipboard(vim.fn.expand('%:p'))
end, { desc = "copy buffer full path to clipboard", })

vim.keymap.set("n", "<leader>bh", function()
  PrintAndWriteToClipboard(vim.fn.expand('%:~'))
end, { desc = "Copy buffer path from home to clipboard", })

vim.keymap.set("n", "<leader>bl", function()
  local path_and_ln = vim.fn.expand('%') .. ':' .. vim.fn.line('.')
  PrintAndWriteToClipboard(path_and_ln)
end, { desc = "Copy buffer path with line to clipboard", })

vim.keymap.set("n", "<leader>tt", function()
  -- build the test command based on file name and line number
  local test_cmd = "\nquit\nbr test " .. vim.fn.expand('%') .. ':' .. vim.fn.line('.') .. "\n"

  -- switch to the terminal window and write the test command to it
  switch_to_term_or_open()
  local chan_id = vim.b.terminal_job_id
  vim.api.nvim_chan_send(chan_id, test_cmd)

  -- scroll to the bottom of the terminal
  local win = vim.api.nvim_get_current_win()
  vim.api.nvim_win_set_cursor(win, { vim.api.nvim_buf_line_count(0), 0 })
end, { desc = "Run test command in terminal", })

vim.keymap.set("n", "<leader>bt", function()
  local test_cmd = 'br test ' .. vim.fn.expand('%') .. ':' .. vim.fn.line('.') .. "\n"
  PrintAndWriteToClipboard(test_cmd)
end, { desc = "Copy test command at line to clipboard", })

vim.cmd([[
" Move a '=fix' commit line below its target commit and mark it '>fix'.
" Safe: prints a message if no =fix line or target pick is found.
function! s:MoveFixupCommit() abort
  " 1. Find the first line containing '=fix <sha>'
  let l:fixlnum = search('^pick\s\+\S\+\s\+=fix', 'n')
  if l:fixlnum == 0
    echo "No '=fix' line found"
    return
  endif

  " 2. Extract the full line and the target SHA
  let l:fixline = getline(l:fixlnum)
  let l:fields = split(l:fixline)
  if len(l:fields) < 4
    echo "Malformed '=fix' line: " .. l:fixline
    return
  endif
  let l:fixsha = l:fields[1]
  let l:targetsha = l:fields[4]

  " 3. Find the matching 'pick <targetsha>' line
  let l:targetlnum = search('^pick\s\+' . l:targetsha, 'n')
  if l:targetlnum == 0
    echo "No 'pick " . l:targetsha . "' found for " . l:fixsha
    return
  endif

  " 4. Construct new line: change 'pick' ? 'fixup' and '=fix' ? '>fix'
  let l:newline = substitute(l:fixline, '^pick', 'fixup', '')
  let l:newline = substitute(l:newline, '=fix', '>fix', '')

  " 5. Delete original =fix line
  call deletebufline('%', l:fixlnum)

  " Adjust target line number if deletion happened above it
  if l:fixlnum < l:targetlnum
    let l:targetlnum -= 1
  endif

  " 6. Insert new line right below the matching pick line
  call append(l:targetlnum, l:newline)

  " 7. Move cursor to the new fixup line and center screen
  call cursor(l:targetlnum + 1, 1)
  normal! zz

  echo "Fixup moved for " . l:fixsha . " -> " . l:targetsha
endfunction

nnoremap <silent> <leader>mf :<C-u>call <SID>MoveFixupCommit()<CR>
]])

local M = {}
function M.cowboy()
  ---@type boolean
  local ok = true
  for _, key in ipairs({ "h", "j", "k", "l", "+", "-" }) do
    local count = 0
    local timer = assert(vim.uv.new_timer())
    local map = key
    vim.keymap.set("n", key, function()
      if vim.v.count > 0 then
        count = 0
      end
      if count >= 10 and vim.bo.buftype ~= "nofile" then
        ok = pcall(vim.notify, "🤠 Hold it Cowboy!", vim.log.levels.WARN, {
          icon = "🤠",
          id = "cowboy",
          keep = function()
            return count >= 10
          end,
        })
        if not ok then
          return map
        end
      else
        count = count + 1
        timer:start(2000, 0, function()
          count = 0
        end)
        return map
      end
    end, { expr = true, silent = true })
  end
end

M.cowboy()
return M
