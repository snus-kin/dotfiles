Plug 'w0rp/ale'

let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_linters = {'tex': ['proselint'], 'markdown': ['proselint'], 'python': ['pylint'], 'javascript': ['prettier', 'eslint']}
let g:ale_sign_error = '>>'
let g:ale_warn_about_trailing_whitespace = 1
let g:ale_lint_on_text_changed = 'always'
let g:ale_c_parse_makefile = 1
let g:ale_c_parse_compile_commands = 1
