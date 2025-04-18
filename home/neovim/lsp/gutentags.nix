{pkgs, ...}: {
  programs.nixvim = {
    globals = {
      gutentags_add_default_project_roots = 0;
      gutentags_project_root = ["package.json" ".git"];
      gutentags_ctags_auto_set_tags = 1;
      gutentags_ctags_auto_add_gtags_cscope = 1;

      tags = "~/.nvim/tags/";
      gutentags_cache_dir = "~/.nvim/tags/";
      gutentags_generate_on_new = 1;
      gutentags_generate_on_missing = 1;
      gutentags_generate_on_write = 1;
      gutentags_generate_on_empty_buffer = 0;

      gutentags_trace = "0";

      gutentags_ctags_extra_args = [
        "--tag-relative=yes"
        "--fields=+ailmnS"
      ];

      gutentags_ctags_exclude = [
        "*.git"
        "*.svg"
        "*.hg"
        "*/tests/*"
        "build"
        "dist"
        "*sites/*/files/*"
        "bin"
        "node_modules"
        "bower_components"
        "cache"
        "compiled"
        "docs"
        "example"
        "bundle"
        "vendor"
        "*.md"
        "*-lock.json"
        "*.lock"
        "*bundle*.js"
        "*build*.js"
        ".*rc*"
        "*.json"
        "*.min.*"
        "*.map"
        "*.bak"
        "*.zip"
        "*.pyc"
        "*.class"
        "*.sln"
        "*.Master"
        "*.csproj"
        "*.tmp"
        "*.csproj.user"
        "*.cache"
        "*.pdb"
        "tags*"
        "cscope.*"
        "*.css"
        "*.less"
        "*.scss"
        "*.exe"
        "*.dll"
        "*.mp3"
        "*.ogg"
        "*.flac"
        "*.swp"
        "*.swo"
        "*.bmp"
        "*.gif"
        "*.ico"
        "*.jpg"
        "*.png"
        "*.rar"
        "*.zip"
        "*.tar"
        "*.tar.gz"
        "*.tar.xz"
        "*.tar.bz2"
        "*.pdf"
        "*.doc"
        "*.docx"
        "*.ppt"
        "*.pptx"
        "*.next"
      ];
    };

    extraPlugins = with pkgs.vimPlugins; [
      vim-gutentags
    ];
  };
}
