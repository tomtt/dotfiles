# Overview of mappings

## Buffer - <leader>b
* f buf.format
* l copy relative path with current line
* p copy full path to clipboard
* r copy relative path
* t copy test current line to clipboard
* x make file executable
* X make file not executable

## Completion / snippets
* Next: C-n / Tab / Down
* Prev: C-p / S-Tab / Up
* Select: C-k (stay in insert mode) / C-y (switch to normal mode)
* Abort (close completion window): C-e
* Close docs: C-d
* Scroll docs: C-f / C-b
* <C-x><C-l> whole line completion
* Snippets:
  * C-l Jump to next location in snippet
  * C-h Jump to prev location in snippet
  * Snippet engine: https://github.com/L3MON4D3/LuaSnip
  * Snippet library: https://github.com/rafamadriz/friendly-snippets

## Coercions - cr
* l toggle pluralization
* t toggle tableize/classify (blog_posts <-> BlogPost)
* s snake_case
* m MixedCase
* c camelCase
* u UPPER_CASE
* '-' dash-case
* . dot.case
* <space> space case

## Command mode
* <C-b> beginning of command
* <C-r>r insert register r
* <C-r><C-f> insert function under cursor?
* <C-r><C-g> insert buffer path
* <C-r><C-l> insert cursor line
* <C-r><C-o>r insert register r?
* <C-r><C-w> insert word under cursor

## Environment - <leader>e
* c Apply colorscheme and transparancy
* e Mini file explorer 
* f Mini file explorer current file
* o Toggle oil float
* R reload remap.lua

## Git / fugitive
* <leader>gl LazyGit
* <leader>gL LazyGit logs
* <leader>gbl show git blame for current line
* <leader>gbr pick from git branches
* :Git (git status)
  * cc create commit
  * C Open the commit containing the current file.
* :Git mergetool -> open merge conflicts in quickfix list
* :Gvdiffsplit! -> open conflict three way split
* :Gwrite! -> write the current file to the index
* \[c / ]c prev / next git conflict
* :help fugitive

## Harpoon
* Add current buffer to harpoon list: <leader>a / <leader>h;
* Toggle harpoon list window: C-e / <leader>he
* Next / prev buffer in harpoon list: C-n / C-p
* Find in harpoon list: <leader>fp
* Go to harpoon buffer: M-a, M-s etc or <leader>h[a-g]

## Lazy
* reload plugin: :Lazy reload <plugin>(tab completed)

## Markdown
* tb toggle bullet
* tc toggle checkbox
* tn toggle number
* tt toggle checked
* <left>/<right> de/increase list level

## Mini files
* <leader>ee: toggle explorer
* <leader>ef: toggle into current file
* =: commit change
* <cr>: go in
* H: go in plus
* -: go out
* L: go out plus

## Modifications - <leader>m
* j Join code (J with mini)
* r Replace word under cursor globally
* s Split code (S with mini)
* t toggle join/split
* Files:
  * o oil
  * e mini file explorer
  * e mini file explorer current file

## Objects
* m method
* M class
* r block
* various: https://github.com/chrisgrieser/nvim-various-textobjs
  * ig code at this indentation
  * gG entire buffer
  * i_ entire line characters
  * ik key
  * iv value
  * i# color

## Quickfix
* From telescope: <C-q> puts results in quickfix list
* :copen / :cclose open/clone quickfix window
* `[q/]q` prev/next quickfix
* <leader>fq to toggle quickfix list
* :cfirst 
* :cdo do command on each entry in quickfix list
* :cfdo do command on each file in quickfix list

## Testing / terminal - <leader>t
* f run tests in file in background
* n run test near cursor in background
* o show output of last background test
* t copy command to run test at current line, run in terminal and go there
* c run coverage just for current test file in terminal
* w toggle watch which runs tests on save for current file
* y swap to terminal buffer (create if does not yet exist)

## Vanilla vim tips
* <s-i>/<s-a> append to start/end of line
* <s-[>/<s-]> goto start/end block
* gi insert at last place you left insert mode
* <c-h> delete last character typed
* <c-w> delete last word typed
* <c-u> delete last line typed
* gp/gP p/P but puts the cursor after the pasted selection
* gn/gN motion: next / previous search match
* g_ non-blank character at the end of a line
* create location list of matches in current buffer:
  * :lv /foo/ %
  * (short for :lvimgrep)
  * (% to indicate current buffer)
  * <leader>fl to toggle location list
  * `[l/]l` prev/next location
  * :ldo / :lfdo work like :cdo / :cfdo
* Replace in multiple files:
  1. Run / test the :%s command
  2. Use :vimgrep to find files matching pattern: :vimgrep // **/*.rb (this uses @/ from step 1)
  3. Run :cfdo <the %s command>
  4. Run :cfdo update (this saves the updated buffers) (or :wall)

# neovim tricks
* Show clients of buffer
  * lua =vim.lsp.get_active_clients({ bufnr = 0 })
* Reload a plugin definition: :Lazy reload plugin
* <C-space>: select code to ever expanding scope (by treesitter)
* :mksession writes Session.vim file

# Todo:
* [ ] <leader>fd should telescope all occurences of binding.pry
* [ ] Running <leader>tt, should not swap current buffer to terminal if it is already visible in another window
* [ ] telescope for luasnippets
* [ ] yaml lsp
* [ ] File loaded with :A should have buffer file path relative to root (or <leader>br should rewrite the path to appear as such)
* [ ] When visual active, <space>fs should use selected text for search
* [ ] cmp / telescope emojis: https://github.com/Allaman/emoji.nvim
* [ ] Try out full mapping for yanky: https://github.com/gbprod/yanky.nvim
* [ ] <space>s often gets unmapped?
* [ ] https://neovimcraft.com/plugin/chrisgrieser/nvim-scissors/ ? create / edit snippets on the fly
* [ ] https://github.com/chrisgrieser/nvim-rip-substitute ?
* [ ] run :checkhealth and fix issues
* [ ] FIXME: Test description like '#add_foo' gets colorized
* [ ] Shortcuts for add pry above current line / remove all prys
* [ ] Custo by 'm function: "copy closest line that matches search"
* [ ] more base useful search/replace operations? https://www.reddit.com/r/neovim/comments/1p0i8pe/what_are_your_favorite_search_and_replace_keymaps/
* [ ] https://github.com/tpope/vim-sexp-mappings-for-regular-people ?
* [ ] make line numbers more readable
* [ ] do not append () when completing a method suggested by lsp
* [ ] toggle watch on test file works, but is it possible to also run test when relevant file is saved?
* [ ] lua formatting of comments fix
* [ ] https://github.com/tpope/vim-dispatch ?
  ### Plugins
  * [ ] 'junegunn/vim-peekaboo' -- show content of registers
  * [ ] 'HiPhish/rainbow-delimiters.nvim'
* watch / read
  * [ ] :help change
  * [ ] https://www.barbarianmeetscoding.com/boost-your-coding-fu-with-vscode-and-vim
  * [ ] https://www.youtube.com/watch?v=m8C0Cq9Uv9o The Only Video You Need to Get Started with Neovim
  * [ ] :help fugitive
  * [ ] http://vimeo.com/tpope/vim-dispatch-teaser

# References
* https://vimhelp.org
* video: https://www.youtube.com/watch?v=FGVY7gbaoQI
  * The Ultimate Neovim Setup Guide From Scratch
  * Seth Phaeno
  * repo: https://github.com/Sin-cy/dotfiles/
* video: https://www.youtube.com/watch?v=6pAG3BHurdM
  * How I Setup Neovim To Make It AMAZING in 2024: The Ultimate Guide
  * Josean Martinez

