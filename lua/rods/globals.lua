P = function(v)
  print(vim.inspect(v))
  return v
end

Has_value = function(tab, val)
    for _, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end

