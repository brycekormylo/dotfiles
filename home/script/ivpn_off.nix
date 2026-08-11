{pkgs}:
pkgs.writers.writeBashBin "ivpn_off"
''
  ivpn disconnect
''
