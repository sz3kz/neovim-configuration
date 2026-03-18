
-- "require" statemets are like Python's "import"s
-- Format:
-- * implicitly looks into the "lua/" directory
-- * substitute "/" with "."
-- * omit ".lua" ending
require("config.lazy")	-- import Lazy package manager
require("windows")	-- import lua/windows.lua (vim line numbering)
require("tabulation")

-- Add key shortcut to add .cpp source file to compilation
