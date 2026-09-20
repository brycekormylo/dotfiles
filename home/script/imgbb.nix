{pkgs}:
# Includes error checking on system rebuild
# pkgs.writeShellApplication {
#   name = "imgbb";
#   text = ''
#     bash ~/scripts/imgbb.sh
#   '';
# }
pkgs.writers.writeBashBin "imgbb"
''
  echo $PATH
  bash ~/scripts/imgbb.sh
''
