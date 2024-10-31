{
  pkgs,
  lib,
  ...
}: {
  # pkgs.writeShellScriptBin "hello" ''
  #  notify-send "Hello world!"
  # '';
  #
  # # Other languages work
  # pkgs.writers.writeBashBin "bashScript" { } ''
  #  notify-send "Hello world!"
  # '';
  # pkgs.writers.writeFishBin "fishScript" { } ''
  #  notify-send "Hello world!"
  # '';
  # pkgs.writers.writeRustBin "rustScript" { } ''
  # fn main() {
  #     println!("Hello World")
  # }
  # '';

  # More advanced
  # Includes error checking on system rebuild
  # pkgs.writeShellApplication {
  #   name = "coolest-shell-app";
  #   runtimeInputs = [pkgs.cowsay pkgs.lolcat];
  #   text = ''
  #   cowsay "Hello" | lolcat
  #   '';
  # };
}
