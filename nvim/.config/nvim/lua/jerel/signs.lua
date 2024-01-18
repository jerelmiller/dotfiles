local M = {}

local signs = {
  error = "",
  warning = "",
  hint = "",
  information = "",
  other = "",
}

M.diagnostic = {
  Error = signs.error,
  Warn = signs.warning,
  Hint = signs.hint,
  Info = signs.information,
}

return M
