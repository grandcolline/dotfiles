--[[
My Functions
]]

local M = {}

-- 現在のファイル名と行番号をコピー
-- Normal モード: "path/file_name.txt:17" の形式
-- Visual モード (複数行): "path/file_name.txt:17-20" の形式
-- Visual モード (1行): "path/file_name.txt:17" の形式
function M.copy_file_path_with_line()
  local path = vim.fn.fnamemodify(vim.fn.expand("%"), ":.")
  local mode = vim.fn.visualmode()

  local result
  if mode ~= '' then
    -- Visual モードで選択されていた場合
    local start_line = vim.fn.line("'<")
    local end_line = vim.fn.line("'>")
    if start_line == end_line then
      -- 1行だけ選択された場合
      result = path .. ":" .. start_line
    else
      -- 複数行選択された場合
      result = path .. ":" .. start_line .. "-" .. end_line
    end
  else
    -- Normal モードの場合
    local line = vim.fn.line(".")
    result = path .. ":" .. line
  end

  vim.fn.setreg('+', result)
end

-- グローバルに公開（キーマップから呼び出せるように）
_G.my = M

return M
