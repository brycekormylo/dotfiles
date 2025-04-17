{pkgs, ...}: {
  # enable zsh autocompletion for system packages (systemd, etc)
  environment = {
    shells = with pkgs; [zsh];
    pathsToLink = ["/share/zsh"];
  };

  programs = {
    less.enable = true;

    zsh = {
      enable = true;
      autosuggestions.enable = true;
      enableCompletion = true;

      syntaxHighlighting = {
        enable = true;
        patterns = {"rm -rf *" = "fg=black,bg=red";};
        styles = {"alias" = "fg=magenta";};
        highlighters = ["main" "brackets" "pattern"];
      };

      zsh-autoenv.enable = true;
      ohMyZsh = {
        enable = true;
        # theme = "robbyrussell";
        theme = "cypher";
        plugins = [
          "git"
          "npm"
          "history"
          "node"
          "rust"
          "deno"
        ];
      };
    };
  };
}
