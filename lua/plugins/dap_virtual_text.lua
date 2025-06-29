require("nvim-dap-virtual-text").setup({
  enabled = true,   -- Active le plugin
  enabled_commands = true,  -- ajoute des commandes :DapVirtualTextEnable/Disable
  highlight_changed_variables = true,
  highlight_new_as_changed = true,
  show_stop_reason = true,
  commented = true,    -- si true : affiche les valeurs comme commentaires
  virt_text_pos = "right_align",       -- ou "overlay", "eol"
  all_frames = true,
  virt_lines = false,
})

