{pkgs, ...}: {
  home.packages = with pkgs; [
    # ffmpegthumbnailer
    # lsix
    # ueberzugpp
  ];
  programs = {
    ranger = {
      enable = true;
      settings = {
        column_ratios = "1,3,4";
        colorscheme = "snow";
        confirm_on_delete = "multiple";
        use_preview_script = "true";
        preview_directories = "true";
        preview_files = "true";
        # preview_images = "true";
        # preview_images_method = "ueberzug";
      };
      extraConfig = ''
        set tilde_in_titlebar true
        set vcs_aware true
        map <C-d> shell dragon -a -x %p
      '';
    };
  };
}
