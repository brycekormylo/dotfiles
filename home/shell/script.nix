{pkgs}:
# Includes error checking on system rebuild
pkgs.writeShellApplication {
  name = "switch";
  runtimeInputs = [pkgs.nh];
  text = ''
    nh os switch ./dot
  '';
}
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

