{pkgs, ...}: {
  programs = {
    gh = {
      enable = true;
      gitCredentialHelper.enable = true;
    };
    git = {
      enable = true;
      signing.format = "ssh";
      settings = {
        user = {
          name = "Bryce Kormylo";
          email = "brycekormylo@outlook.com";
        };
        push = {autoSetupRemote = true;};
        http.postBuffer = 157286400;
        credential.helper = "${
          pkgs.git.override {withLibsecret = true;}
        }/bin/git-credential-libsecret";
      };
    };
  };
}
