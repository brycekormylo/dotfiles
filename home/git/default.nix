{pkgs, ...}: {
  programs = {
    gh = {
      enable = true;
      gitCredentialHelper.enable = true;
    };
    git = {
      enable = true;
      userName = "Bryce Kormylo";
      userEmail = "brycekormylo@outlook.com";
      signing.format = "ssh";
      extraConfig = {
        push = {autoSetupRemote = true;};
        http.postBuffer = 157286400;
        credential.helper = "${
          pkgs.git.override {withLibsecret = true;}
        }/bin/git-credential-libsecret";
      };
    };
  };
}
