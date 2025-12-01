{ pkgs ? import <nixpkgs> {} }:
let servers = {
  "*" = {
    config = {
      shiftwidth=2;
      capabilities.textDocument.semanticTokens.multilineTokenSupport = true;
      root_markers = [
	".git"
      ];
      };
    };
  clangd = {
    config = {
      cmd = [
	"clangd"
	  "--background-index"
      ];
      filetypes = ["c" "cpp"];
    };
    enable = true;
  };
  pylsp = {
    enable = true;
    package = pkgs.ruff;
    config = {
      cmd = ["pylsp" "--ws"];
      filetypes = ["py"];
    };
  };
  pyrefly.enable = true;
  lua_ls.enable = true;
  ruff.enable = true;
  nixd.enable = true;
  pylyzer.enable = false;
  tinymist.enable = true;
};
in 
let source = import (
    builtins.fetchGit {url = "https://github.com/nix-community/nixvim";}
    );
in
let
nvim = source.legacyPackages.x86_64-linux.makeNixvim {
  globals.mapleader = " ";
  plugins.lspconfig.enable=true;
  plugins.web-devicons.enable=true;
  plugins.trouble = {
    enable = true;
    autoLoad = true;
  };
  extraConfigVim = ''
      set number
      set tabstop=2
      set shiftwidth=2
			xnoremap <silent> <C-,> :w !wl-copy<CR><CR>
    '';
  plugins.cmp = {
  	enable = true;
	autoEnableSources = true;
	autoLoad = true;
	lazyLoad.enable = false;
	settings.sources = [
		{ enable = true; name = "nvim_lsp"; }
		{ enable = true;name = "nvim_lsp_document_symbol"; }
		{ enable = true; name = "nvim_lsp_signature_help"; }
		{ enable = true; name = "vim_lsp"; }
		{ enable = true; name = "diag-codes"; }
		{ enable = true; name = "path"; }
		{ enable = true; name = "buffer"; }
	];
	settings.mapping = {
		"<C-Space>" = "cmp.mapping.complete()";
		"<C-d>" = "cmp.mapping.scroll_docs(-4)";
		"<C-e>" = "cmp.mapping.close()";
		"<C-f>" = "cmp.mapping.scroll_docs(4)";
		"<CR>" = "cmp.mapping.confirm({ select = true })";
		"<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
		"<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
	};
	package=pkgs.vimPlugins.nvim-cmp;
};

  lsp.inlayHints.enable = false;
  lsp.servers = servers;
  colorschemes.gruvbox-material.enable = true;
};
in nvim
