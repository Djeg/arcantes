--@type MappingsTable
local M = {}

local function delete_buffer()
  require("bufdelete").bufdelete(0, true)
end

M.disabled = {
  n = {
    ["<C-p>"] = "",
    ["<C-h>"] = "",
    ["<C-j>"] = "",
    ["<C-k>"] = "",
    ["<C-l>"] = "",
    ["<leader>gb"] = "",
    ["<leader>gs"] = "",
    ["<C-b>"] = "",
    ["<C-c>"] = "",
  },
}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<C-l>"] = { "w", "Move to the next word", opts = { nowait = true } },
    ["<C-h>"] = { "b", "Move to the previous word", opts = { nowait = true } },
    ["<C-j>"] = { "4j", "Move to 4 j", opts = { nowait = true } },
    ["<C-k>"] = { "4k", "Move to 4 k", opts = { nowait = true } },
    ["<leader>q"] = { delete_buffer, "Delete the current buffer", opts = { nowait = true } },
    ["<leader>ycf"] = {
      ':let @+ = expand("%")<CR>',
      "Copy the current file path",
      opts = { nowait = true, silent = true },
    },
    ["<leader>yal"] = { "<cmd> %y+ <CR>", "Copy whole file", opts = { nowait = true } },
    ["<leader>trs"] = {
      function()
        require("base46").toggle_transparency()
      end,
      "Toggle transparency",
    },
  },
  v = {
    [">"] = { ">gv", "indent" },
    ["<C-l>"] = { "w", "Move to the next word", opts = { nowait = true } },
    ["<C-h>"] = { "b", "Move to the previous word", opts = { nowait = true } },
    ["<C-j>"] = { "4j", "Move to 4 j", opts = { nowait = true } },
    ["<C-k>"] = { "4k", "Move to 4 k", opts = { nowait = true } },
  },
}

M.telescope = {
  n = {
    ["<C-p>"] = { "<cmd> Telescope find_files <CR>", "Find files" },
    ["<C-a>"] = { "<cmd> Telescope file_browser path=%:p:h select_buffer=true <CR>", "File browser" },
    ["<C-b>"] = { ":Telescope buffers<CR>", "Open buffers in telescope", opts = { nowait = true } },
    ["<leader>gst"] = { ":Telescope git_status<CR>", "Open git statuses", opts = { nowait = true } },
    ["<leader>gb"] = { ":Telescope git_branches<CR>", "Open git branches", opts = { nowait = true } },
  },
}

M.lspconfig = {
  n = {
    ["<leader>gD"] = {
      function()
        vim.lsp.buf.declaration()
      end,
      "LSP declaration",
    },
    ["<leader>gd"] = {
      function()
        vim.lsp.buf.definition()
      end,
      "LSP definition",
    },

    ["K"] = {
      function()
        vim.lsp.buf.hover()
      end,
      "LSP hover",
    },

    ["<leader>gi"] = {
      function()
        vim.lsp.buf.implementation()
      end,
      "LSP implementation",
    },

    ["<leader>ls"] = {
      function()
        vim.lsp.buf.signature_help()
      end,
      "LSP signature help",
    },

    ["<leader>D"] = {
      function()
        vim.lsp.buf.type_definition()
      end,
      "LSP definition type",
    },

    ["<leader>rn"] = {
      function()
        require("nvchad.renamer").open()
      end,
      "LSP rename",
    },

    ["<leader>ca"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "LSP code action",
    },

    ["<leader>gr"] = {
      function()
        vim.lsp.buf.references()
      end,
      "LSP references",
    },

    ["<leader>lf"] = {
      function()
        vim.diagnostic.open_float({ border = "rounded" })
      end,
      "Floating diagnostic",
    },

    ["[d"] = {
      function()
        vim.diagnostic.goto_prev({ float = { border = "rounded" } })
      end,
      "Goto prev",
    },

    ["]d"] = {
      function()
        vim.diagnostic.goto_next({ float = { border = "rounded" } })
      end,
      "Goto next",
    },

    ["<leader>wa"] = {
      function()
        vim.lsp.buf.add_workspace_folder()
      end,
      "Add workspace folder",
    },

    ["<leader>wr"] = {
      function()
        vim.lsp.buf.remove_workspace_folder()
      end,
      "Remove workspace folder",
    },

    ["<leader>wl"] = {
      function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end,
      "List workspace folders",
    },

    ["<leader>top"] = {
      function()
        vim.lsp.buf.execute_command({
          command = "_typescript.organizeImports",
          arguments = { vim.api.nvim_buf_get_name(0) },
          title = "",
        })
      end,
      "Organize typescript imports",
    },
  },

  v = {
    ["<leader>ca"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "LSP code action",
    },
  },
}

M.webdev = {
  n = {
    ["<leader>esl"] = {
      ":!eslint_d --fix % <CR>",
      "Run eslint on the current file",
      opts = { nowait = true, silent = true },
    },
  },
}

return M
