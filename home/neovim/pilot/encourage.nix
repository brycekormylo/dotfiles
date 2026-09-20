{pkgs, ...}: {
  programs.nixvim = {
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "encourage";
        src = pkgs.fetchFromGitHub {
          owner = "r-cha";
          repo = "encourage.nvim";
          rev = "acca5a06dece315d2944d7a1ce07ffecc1901a83";
          hash = "sha256-1QDMATZkPTUzYnifAdF9X5bixj9nMOD6PnOg26woRfc=";
        };
      })
    ];
    extraConfigLua = ''
      require("encourage").setup({
      	messages = {
      		"pilot ejecting  ",
      		"viper's got you in the pipe, 5x5",
      		"eject now eject  ",
      		"core break in progress  ",
      		"destruct sequence engaged  ",
      		"eject-system engaged  ",
      		"protocol [03]  ",
      		"it was fun.  ",
      		"ain't over till it's over.  ",
      		"until next time, then.  ",
      		"second star to the right.  ",
      		"go get 'em, tiger.  ",
      		"make it so.  ",
      		"see you on the other side.  ",
      		"wait for the wheel.  ",
      		"do not throw your shot.  ",
      		"drop and burn 'em up.  ",
      		"exhibit no restraint.  ",
      		"rip and saw.  ",
      		"code zero zero zero. destruct. zero.  ",
      		"authorization alpha-alpha 3-0-5.  ",
      		"have just the greatest day.  ",
      		"avenge me.  ",
      		"stay safe.  ",
      		"situation normal.  ",
      		"protocol <3  ",
      		"fly, you fool.  ",
      		"never give up. never surrender.  ",
      		"in case of doubt, attack.  ",
      		"you’re never beaten until you admit it.  ",
      		"wrong us, shall we not revenge?  ",
      		"tilt all are one.  ",
      		"nothing but the rain.  ",
      		"sometimes, you have to roll a hard six.  ",
      		"and sometimes, when you fall, you fly.  ",
      		"see you space cowboy...  ",
      		"just another day at the office.  ",
      		"end of line.  ",
      		"fortune favors the bold.  ",
      		"a leaf on the wind.  ",
      		"you are who you choose to be.  ",
      		"always.  ",
      		"finish the fight.  ",
      	},
      })
    '';
  };
}
