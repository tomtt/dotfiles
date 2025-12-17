return {
  "AndrewRadev/switch.vim",
  config = function()
    vim.cmd([[
    let g:switch_custom_definitions =
    \ [
    \ switch#Words(['y', 'n']),
    \ switch#Words(['yes', 'no']),
    \ switch#Words(['if', 'unless']),
    \ switch#Words(['disable', 'enable']),
    \ switch#Words(['assert_not', 'assert']),
    \ switch#Words(['assert_not_includes', 'assert_includes']),
    \ switch#Words(['assert_changes', 'assert_no_changes']),
    \ switch#Words(['assert_difference', 'assert_no_difference']),
    \ switch#Words(['assert_not_equal', 'assert_equal']),
    \ switch#Words(['a', 'an']),
    \ switch#Words(['is', 'are']),
    \ switch#Words(['first', 'second', 'third', 'fourth', 'fifth', 'sixth']),
    \ ['success', 'failure'],
    \ ['succeeded', 'failed'],
    \ switch#Words(['succeed', 'fail']),
    \ switch#Words(['succeeds', 'fails']),
    \ switch#Words(['with', 'without']),
    \ switch#Words(['potential_customer', 'non_potential_customer'])
    \ ]
    ]])
  end,
}
