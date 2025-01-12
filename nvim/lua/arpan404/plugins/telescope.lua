local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
  return
end

local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
  return
end

telescope.setup({
  defaults = {
    mappings = {
      i = {
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        ["<esc>"] = actions.close,
        ["<CR>"] = actions.select_default,
      },
    },
    file_ignore_patterns = {
      "node_modules",
      ".git",
      "target",
      "vendor"
    },
    path_display = { "truncate" },
    sorting_strategy = "ascending",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
      },
      vertical = {
        mirror = false,
      },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120,
    },
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    prompt_prefix = "🔍 ",
    selection_caret = "➤ ",
  }
})

-- Enable telescope fzf native if installed
pcall(require('telescope').load_extension, 'fzf')