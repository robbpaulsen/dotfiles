title               = "Corky API Documentation"
project             = "Corky"
all                 = true
format              = "markdown"
file                = "lua"
dir                 = "docs"
package             = "corky"
backtick_references = false
description         = "Lua modules for Conky."
prettify_files      = "show"
sort                = true
boilerplate         = true

-- Module level info aliases:
alias ("MO", "module"   )
alias ("AL", "alias"    )
alias ("RE", "release"  )
alias ("AU", "author"   )
alias ("CO", "copyright")
alias ("LI", "license"  )
alias ("SE", "set"      )

-- General aliases for functions:
alias ("p", "param" )
alias ("r", "return")
alias ("c", "see"   )
alias ("L", "local" )

-- Parameter types:
tparam_alias ("s", "string"  )
tparam_alias ("n", "number"  )
tparam_alias ("i", "int"     )
tparam_alias ("b", "bool"    )
tparam_alias ("f", "function")
tparam_alias ("t", "table"   )

-- Return types:
alias ('S', { 'return', modifiers = { type = "string"   } })
alias ('N', { 'return', modifiers = { type = "number"   } })
alias ('I', { 'return', modifiers = { type = "int"      } })
alias ('B', { 'return', modifiers = { type = "bool"     } })
alias ('F', { 'return', modifiers = { type = "function" } })
alias ('T', { 'return', modifiers = { type = "table"    } })

-- Custom types:
new_type ("l", "Local Tables")