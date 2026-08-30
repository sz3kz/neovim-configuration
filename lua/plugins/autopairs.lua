-- Autopairing brackets and parentheses


-- Plugin Installation Boilerplate
return {
  'windwp/nvim-autopairs',
  event = "InsertEnter",
  config = true,
  opt = {}
}
