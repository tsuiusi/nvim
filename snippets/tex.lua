local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

return {
  -- Article boilerplate
  s('article', {
    t {
      '\\documentclass[12pt]{article}',
      '\\usepackage[utf8]{inputenc}',
      '\\usepackage{amsmath,amssymb,amsthm}',
      '\\usepackage{graphicx}',
      '\\usepackage{hyperref}',
      '\\usepackage[margin=1in]{geometry}',
      '',
      '\\title{',
    },
    i(1, 'Title'),
    t { '}', '\\author{' },
    i(2, 'Author'),
    t { '}', '\\date{\\today}', '', '\\begin{document}', '\\maketitle', '', '' },
    i(3, 'Content'),
    t {
      '',
      '',
      '\\end{document}',
    },
  }),

  -- Quick environments
  s('beg', {
    t '\\begin{',
    i(1, 'environment'),
    t { '}', '\t' },
    i(2),
    t {
      '',
      '\\end{',
    },
    f(function(args)
      return args[1]
    end, { 1 }),
    t '}',
  }),

  -- Math snippets
  s('eq', {
    t { '\\begin{equation}', '\t' },
    i(1),
    t { '', '\\end{equation}' },
  }),

  s('align', {
    t { '\\begin{align}', '\t' },
    i(1),
    t { '', '\\end{align}' },
  }),

  -- Common commands
  s('sec', { t '\\section{', i(1), t '}' }),
  s('ssec', { t '\\subsection{', i(1), t '}' }),
  s('sssec', { t '\\subsubsection{', i(1), t '}' }),

  -- Text formatting
  s('bf', { t '\\textbf{', i(1), t '}' }),
  s('it', { t '\\textit{', i(1), t '}' }),
  s('tt', { t '\\texttt{', i(1), t '}' }),
}
