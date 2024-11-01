{pkgs, ...}: {
  # home.packages = with pkgs; [
  #   gh
  # ];
  programs = {
    gh = {
      enable = true;
      gitCredentialHelper.enable = true;
    };
    git = {
      enable = true;
      userName = "Bryce Kormylo";
      userEmail = "brycekormylo@outlook.com";
      extraConfig = {
        http.postBuffer = 157286400;
      };
    };
  };
}
