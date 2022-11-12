local M = {}

local function file_exists(file)
  local f = io.open(file, "rb")
  if f then f:close() end
  return f ~= nil
end

local function lines_from(file)
  if not file_exists(file) then return {} end
  local lines = {}
  for line in io.lines(file) do
    lines[#lines + 1] = line
  end
  return lines
end

function M.setup()
  local nvim_dir = vim.fn.expand("~/.config/nvim")
  local file = nvim_dir .. '/lua/rods/abbreviation/data.txt'
  -- print('file exists [' .. tostring(file_exists(file)) .. ']')
  local lines = lines_from(file)
  for _, v in pairs(lines) do
    vim.cmd('iab ' .. v)
  end
end

return M
