{
  lib,
  config,
  ...
}: {
  options = {
    module.enable =
      lib.mkDefault true;
  };

  config = lib.mkIf config.module.enable {
    option1 = 5;
    option2 = true;
  };
}
