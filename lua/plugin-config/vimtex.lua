-- PDF Viewer:
vim.g['vimtex_view_method'] = 'zathura'
vim.g['vimtex_context_pdf_viewer'] = 'okular'
vim.g['vimtex_quickfix_mode'] = 2

-- Ignore mappings
vim.g['vimtex_mappings_enabled'] = 0

-- Auto Indent
vim.g['vimtex_indent_enabled'] = 1

-- Error suppression:
-- https://github.com/lervag/vimtex/blob/master/doc/vimtex.txt
vim.g['vimtex_log_ignore'] = ({
  'Underfull',
  'Overfull',
  'specifier changed to',
  'Token not allowed in a PDF string',
})


vim.g['tex_flavor'] = 'latex'
vim.g['tex_indent_items'] = 0              -- turn off enumerate indent
vim.g['tex_indent_brace'] = 0              -- turn off brace indent
vim.g['vimtex_complete_close_braces'] = 1
