return {
  {
    "sindrets/diffview.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("diffview").setup({
        -- Default configuration
        diff_binaries = false,    -- Show diffs for binaries
        enhanced_diff_hl = false, -- See ':h diffview-config-enhanced_diff_hl'
        use_icons = true,         -- Requires nvim-web-devicons
        icons = {                 -- Only applies when use_icons is true
          folder_closed = "",
          folder_open = "",
        },
        signs = {
          fold_closed = "",
          fold_open = "",
          done = "✓",
        },
        view = {
          default = {
            layout = "diff2_horizontal",
          },
          merge_tool = {
            layout = "diff3_horizontal",
            disable_diagnostics = true,
          },
          file_history = {
            layout = "diff2_horizontal",
          },
        },
        file_panel = {
          listing_style = "tree",           -- One of 'list' or 'tree'
          tree_options = {                  -- Only applies when listing_style is 'tree'
            flatten_dirs = true,            -- Flatten dirs that only contain one single dir
            folder_statuses = "only_folded", -- One of 'never', 'only_folded' or 'always'
          },
          win_config = {                    -- See ':h diffview-config-win_config'
            position = "left",
            width = 35,
          },
        },
        file_history_panel = {
          win_config = {                    -- See ':h diffview-config-win_config'
            position = "bottom",
            height = 16,
          },
        },
        commit_log_panel = {
          win_config = {},                  -- See ':h diffview-config-win_config'
        },
        default_args = {                    -- Default args prepended to the arg-list for the listed commands
          DiffviewOpen = {},
          DiffviewFileHistory = {},
        },
        hooks = {},                         -- See ':h diffview-config-hooks'
        keymaps = {
          disable_defaults = false,         -- Disable the default keymaps
          view = {
            -- Add keymaps here if you want to customize the default mappings
          },
          file_panel = {
            -- Add keymaps here for file panel
          },
          file_history_panel = {
            -- Add keymaps here for file history panel
          },
          option_panel = {
            -- Add keymaps here for option panel
          },
        },
      })
    end,
  },
}
