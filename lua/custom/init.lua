-- -- Show only modified buffers
-- Defaults
--
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
  vim.o.guifont = "OverpassM Nerd Font Mono:14" -- text below applies for VimScript
  vim.g.neovide_cursor_vfx_mode = "wireframe"
  -- vim.g.neovide_refresh_rate = 240
  vim.g.neovide_hide_mouse_when_typing = true
  -- vim.g.neovide_transparency = false

  -- vim.g.neovide_position_animation_length = 0.15
  -- vim.g.neovide_cursor_animation_length = 0.04

  -- Scale Factor for Neovide
  vim.g.neovide_scale_factor = 1.0
  vim.g.neovide_confirm_quit = false

  vim.g.neovide_floating_shadow = false

  vim.g.neovide_remember_window_size = true
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
