return {
  {
    "tpope/vim-rails",
    config = function()
      vim.keymap.set({ "n" }, "<Leader>rm", ":Emodel<Space>")
      vim.keymap.set({ "n" }, "<Leader>rc", ":Econtroller<Space>")
      vim.keymap.set({ "n" }, "<Leader>rl", ":Elocale<Space>")
      vim.keymap.set({ "n" }, "<Leader>rn", ":Elocale nl<cr>")
      vim.keymap.set({ "n" }, "<Leader>rv", ":Eview<Space>")
      vim.keymap.set({ "n" }, "<Leader>rs", ":Eschema<Space>")
      vim.keymap.set({ "n" }, "<Leader>ri", ":Emigration<Space>")
      vim.keymap.set({ "n" }, "<Leader>rt", ":Rails test<cr>")
    end,
  },
  {
    "tpope/vim-projectionist",

    config = function()
      vim.cmd([[
        function! s:AlternateOrCreate() abort
        " Get the resolved alternate path for the current buffer
        let alts = projectionist#query('alternate')   " -> [ [root, resolved_path], ... ]
        if type(alts) != type([]) || empty(alts) || empty(alts[0][1])
        echoerr 'No alternate mapping for this file.'
        return
        endif
        let alt = alts[0][1]

        " If it exists, just open it; else create it and drop in the template
        if filereadable(alt)
        execute 'edit' fnameescape(alt)
        else
        call mkdir(fnamemodify(alt, ':h'), 'p')
        execute 'edit' fnameescape(alt)
        " If a template is defined in your projections, apply it
        silent! AD
        endif
        endfunction
        ]])
      vim.keymap.set({ "n" }, "<leader>ra", "<C-W>o:AV<cr>")
      vim.keymap.set({ "n" }, "<leader>rr", "<C-W>o:RV<cr>")
      vim.keymap.set('n', "<Leader>rA", ":call <SID>AlternateOrCreate()<CR>")
    end,
  },
}
