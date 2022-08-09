-- nvim-dap-go
local dapgo = require('dap-go')
dapgo.setup();

-- nvim-dap-python
local venv = os.getenv("VIRTUAL_ENV");
local dappython = require('dap-python');
dappython.setup(
  string.format("%s/bin/python", venv)
)

local dap = require('dap');
dap.adapters.python = {
  type = 'executable';
  command = string.format("%s/bin/python", venv);
  args = { '-m', 'debugpy.adapter' };
}

dap.configurations.python = {
  {
    type = 'python';
    request = 'launch';
    name = "Launch Current File";
    program = "${file}";
    pythonPath = function()
      local cwd = vim.fn.getcwd()
      if vim.fn.executable(venv .. '/bin/python') == 1 then
        return venv .. '/bin/python'
      elseif vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
        return cwd .. '/venv/bin/python'
      elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
        return cwd .. '/.venv/bin/python'
      else
        error('Python Virtual Environment not found. Please create, activate and reopen editor.')
      end
    end;
  },
}



-- remember to delete vscode launch.json trailing comma
require('dap.ext.vscode').load_launchjs()

vim.fn.sign_define('DapBreakpoint', { text = '🍎', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapStopped', { text = '🐛', texthl = '', linehl = '', numhl = '' })

require("dapui").setup({
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  -- Expand lines larger than the window
  -- Requires >= 0.7
  expand_lines = vim.fn.has("nvim-0.7"),
  layouts = {
    {
      elements = {
        'scopes',
        'breakpoints',
        'stacks',
        'watches',
      },
      size = 60,
      position = 'left',
    },
    {
      elements = {
        'repl',
        -- 'console',
      },
      size = 10,
      position = 'bottom',
    },
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = "double", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil, -- Can be integer or nil.
  }
})

require('nvim-dap-virtual-text').setup()

local dapui = require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
