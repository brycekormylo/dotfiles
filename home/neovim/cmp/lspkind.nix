{
  programs.nixvim = {
    plugins.lspkind = {
      enable = true;
      extraOptions = {
        maxwidth = 50;
        ellipsis_char = "...";
      };
      cmp = {
        menu = {
          buffer = "[buf]";
          nvim_lsp = "[LSP]";
          nvim_lua = "[api]";
          path = "[path]";
          luasnip = "[snip]";
          gh-issues = "[issues]";
          tn = "[TabNine]";
          eruby = "[erb]";
        };
        after = ''
          function(entry, item)
                local entryItem = entry:get_completion_item()
                local color = entryItem.documentation

                -- check if color is hexcolor
                if color and type(color) == "string" and color:match "^#%x%x%x%x%x%x$" then
                  local hl = "hex-" .. color:sub(2)

                  if #vim.api.nvim_get_hl(0, { name = hl }) == 0 then
                    vim.api.nvim_set_hl(0, hl, { fg = color })
                  end

                  item.menu = " "
                  item.menu_hl_group = hl

                  -- else
                  -- add your lspkind icon here!
                  -- item.menu_hl_group = item.kind_hl_group
                end

                return item
              end
        '';
      };
    };
    extraConfigLua = ''
      kind_icons = {
      	Text = "󰊄",
      	Method = "",
      	Function = "󰡱",
      	Constructor = "",
      	Field = "",
      	Variable = "󱀍",
      	Class = "",
      	Interface = "",
      	Module = "󰕳",
      	Property = "",
      	Unit = "",
      	Value = "",
      	Enum = "",
      	Keyword = "",
      	Snippet = "",
      	Color = "",
      	File = "",
      	Reference = "",
      	Folder = "",
      	EnumMember = "",
      	Constant = "",
      	Struct = "",
      	Event = "",
      	Operator = "",
      	TypeParameter = "",
      }
    '';
  };
}
