-- -- Show only modified buffers
-- vim.api.nvim_create_autocmd({ 'BufAdd', 'BufEnter' }, {
-- 	callback = function()
-- 		vim.t.bufs = vim.tbl_filter(function(bufnr)
-- 			return vim.api.nvim_buf_get_option(
-- 				bufnr,
-- 				'modified'
-- 			)
-- 		end, vim.t.bufs)
-- 	end,
-- })
--
if vim.g.neovide then
  -- General Settings
  vim.o.guifont = "Agave Nerd Font Mono:h18" -- text below applies for VimScript
  vim.g.neovide_cursor_vfx_mode = "railgun"
  vim.g.neovide_input_macos_alt_is_meta = true
  linespace = 15

  -- Scale Factor for Neovide
  vim.g.neovide_scale_factor = 1.0
  local change_scale_factor = function(delta)
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
  end
  vim.keymap.set("n", "<C-=>", function()
    change_scale_factor(1.25)
  end)
  vim.keymap.set("n", "<C-->", function()
    change_scale_factor(1 / 1.25)
  end)
end
