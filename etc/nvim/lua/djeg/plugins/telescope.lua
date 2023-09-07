-- import telescope plugin safely
local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
  return
end

-- import telescope actions safely
local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
  return
end

-- import theme
local themes_setup, themes = pcall(require, "telescope.themes")
if not themes_setup then
  return
end

-- configure telescope
telescope.setup({
  -- configure custom mappings
  defaults = {
    mappings = {
      i = {
        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
        ["<C-j>"] = actions.move_selection_next, -- move to next result
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
        ["<A-a>"] = telescope.extensions.file_browser.actions.create_from_prompt,
        ["<A-r>"] = telescope.extensions.file_browser.actions.rename,
        ["<A-d>"] = telescope.extensions.file_browser.actions.remove,
      },
    },
    path_display = { "smart" },
  },
  pickers = {
    find_files = themes.get_ivy(),
  },
  extensions = {
    file_explorer = {
      theme = themes.get_ivy(),
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
    },
  },
})

telescope.load_extension("fzf")
telescope.load_extension("file_browser")
telescope.load_extension("live_grep_args")

-- configue keymaps for telescope
vim.keymap.set("n", "<C-p>", ":Telescope find_files<CR>")
vim.keymap.set("n", "<C-b>", ":Telescope buffers<CR>")
vim.keymap.set("n", "<C-f>", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")
vim.keymap.set("n", "<C-s>", ":Telescope lsp_dynamic_workspace_symbols<CR>")
vim.keymap.set("n", "<leader>gbr", ":Telescope git_branches<CR>")
vim.keymap.set("n", "<C-g>", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
