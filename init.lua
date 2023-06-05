vim.g.mapleader = ","
vim.b.mapleader = ","

require("rods/globals")    -- 🟩 done
require("rods/funcs")      -- 🟩 done
require("rods/packer")     -- 🟩 done
require("rods/options")    -- 🟩 done
require("rods/mappings")   -- 🟩 done
require("rods/autocmds")   -- 🟩 done

require("rods/abbreviation/abbrev").setup()  -- 🟩 done
require("rods/funcs").setCustomHighLights()  -- 🟩 done

-- vim.lsp.set_log_level("debug")
-- :lua vim.cmd('e'..vim.lsp.get_log_path())
