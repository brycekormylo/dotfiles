{pkgs}:
pkgs.writers.writeBashBin "ivpn_on"
''
  ivpn connect --last
''
