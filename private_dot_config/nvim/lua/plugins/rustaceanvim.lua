return {
  'mrcjkb/rustaceanvim',
  version = '^5',
  lazy = false,
  config = function()
    vim.g.rustaceanvim = {
      server = {
        default_settings = {
        ['rust-analyzer'] = {
          diagnostics = {
            enable = true,
            experimental = {
              enable = true,
            },
            styleLints = {
              enable = true,
            }
          },
          cargo = {
            allFeatures = true,
          },
        },
        },
      },
    }
  end
}
