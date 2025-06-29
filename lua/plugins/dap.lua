local dap = require("dap")
local dapui = require("dapui")

-- UI configuration
dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- Python debugger setup (change le chemin si besoin)
require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")
