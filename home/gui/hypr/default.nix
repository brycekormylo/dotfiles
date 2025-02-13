{
  pkgs,
  config,
  ...
}: {
  home.pointerCursor = {
    name = "phinger-cursors-light";
    package = pkgs.phinger-cursors;
    size = 32;
    gtk.enable = true;
  };

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = false;
    systemd.variables = ["--all"];

    settings = {
      input = {
        kb_layout = "us";
        kb_options = "caps:swapescape";
        touchpad.natural_scroll = true;
        follow_mouse = 1;
        sensitivity = 0.6;
      };

      general = {
        gaps_in = 0;
        gaps_out = 0;
        border_size = 1;
        resize_on_border = true;
        hover_icon_on_border = false;
        layout = "dwindle";
        allow_tearing = false;
        "col.active_border" = "rgb(${config.colorScheme.palette.base04})";
        "col.inactive_border" = "rgb(${config.colorScheme.palette.base02})";
      };

      decoration = {
        rounding = 2;
      };

      animations = {
        enabled = false;
      };

      dwindle = {
        pseudotile = "yes";
        preserve_split = true;
        force_split = 2;
        # no_gaps_when_only = 1;
      };

      gestures = {
        workspace_swipe = "on";
      };

      misc = {
        force_default_wallpaper = 0;
        vfr = true;
      };

      exec-once = [
        # "dbus-update-activation-environment --systemd --all WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "uwsm app -- waypaper --restore"
        "uwsm app -- ags"
        "uwsm app -- firefox"
        "ivpn connect --last"
        "sudo tlp start"
      ];

      "env" = [
        "HYPRCURSOR_SIZE,24"
        "HYPRCURSOR_THEME,phinger-cursors"

        "XCURSOR_SIZE,24"
        "XCURSOR_THEME,phinger-cursors"

        "GDK_BACKEND,wayland,x11,*"
        "NVD_backend,direct"

        "HYPRLAND_TRACE,1"
        "AQ_TRACE,1"

        "QT_QPA_PLATFORM,wayland;xcb"
        "SDL_VIDEODRIVER,wayland,x11"
        "CLUTTER_BACKEND,wayland"

        # "XDG_CURRENT_DESKTOP,Hyprland"
        # "XDG_SESSION_TYPE,wayland"
        # "XDG_SESSION_DESKTOP,Hyprland"

        "LIBVA_DRIVER_NAME,nvidia"
        "__GLX_VENDOR_LIBRARY_NAME,nvidia"
        "__GL_VRR_ALLOWED,0"
        "GBM_BACKEND,nvidia-drm"
      ];

      "monitor" = ",preferred,auto,auto";
      "$mod" = "SUPER";
      "$terminal" = "uwsm app -- kitty";
      "$fileManager" = "uwsm app -- kitty ranger --confdir ~/.config/ranger";
      "$menu" = "rofi -show drun -show-icons  -run-command 'uwsm app -- {cmd}'";
      "$sysMonitor" = "uwsm app -- kitty gotop";
      "$notes" = "uwsm app -- kitty --single-instance -d ~/psi vi .";
      "$health" = "uwsm app -- kitty --single-instance -d ~/vaults/health vi .";
      "$browser" = "uwsm app -- firefox";
      "$ivpnOn" = "ivpn connect -last";
      "$ivpnOff" = "ivpn disconnect";
      "$config" = "uwsm app -- kitty --single-instance -d ~/dot bash dev.sh";

      "$captureAll" = "~/scripts/screenshots/captureAll.sh";
      "$captureScreen" = "~/scripts/screenshots/captureScreen.sh";
      "$captureArea" = "~/scripts/screenshots/captureArea.sh";

      "windowrulev2" = "suppressevent maximize, class:.*";
      "workspace" = "special:magic, on-created-empty: $config ";

      bind = [
        "$mod, Q, killactive,"
        "$mod, T, exec, $terminal"
        "$mod, M, exec, $sysMonitor"
        "$mod, W, exec, $browser"
        "$mod, F, exec, $fileManager"
        "$mod, E, exec, $menu"
        "$mod, N, exec, $notes"
        "$mod, H, exec, $health"

        "$mod, I, exec, $ivpnOn"
        "$mod SHIFT, I, exec, $ivpnOff"

        "$mod SHIFT, A, exec, $captureAll"
        "$mod SHIFT, Y, exec, $captureArea"
        "$mod, Y, exec, $captureScreen"

        "$mod, X, togglesplit"
        "$mod, P, togglefloating,"
        "$mod SHIFT, R, layoutmsg, swapsplit"
        "$mod, Tab, cyclenext"

        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, J, workspace, 1"
        "$mod, K, workspace, 2"
        "$mod, L, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"

        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"

        "$mod, mouse_down, workspace, e+1"
        "$mod, mouse_up, workspace, e-1"

        "$mod, S, togglespecialworkspace, magic"
        "$mod SHIFT, S, movetoworkspace, special:magic"
      ];
      binde = [
        ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86AudioMute, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 0%"
      ];
      bindm = [
        "$mod, mouse272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
    };
  };
}
