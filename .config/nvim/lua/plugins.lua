local fn = vim.fn

-- Auto instalación de Packer si no existe
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth", "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Packer instalado, reinicia Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

local status_ok, packer = pcall(require, "packer")
if not status_ok then return end

-- Auto sync tras guardar
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Aquí van tus plugins
return packer.startup(function(use)
  use "wbthomason/packer.nvim"
  use "rebelot/kanagawa.nvim"

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
