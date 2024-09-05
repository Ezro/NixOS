{ config, lib, pkgs, ... }:
{
  home.stateVersion = "24.05";
  home.username = "hypr";
  home.homeDirectory = "/home/hypr";
  programs.home-manager.enable = true;
  stylix.image = pkgs.fetchurl {
    url = "https://www.pixelstalk.net/wp-content/uploads/2016/05/Epic-Anime-Awesome-Wallpapers.jpg";
    sha256 = "enQo3wqhgf0FEPHj2coOCvo7DuZv+x5rL/WIo4qPI50=";
  };
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "monitor" = "DP-1,2560x1440@60,1920x0,1\nmonitor=HDMI-A-1,1920x1080@60,0x380,1";
      "$mod" = "SUPER"; # Main Keybind
      "$term" = "kitty"; # Sets default terminal
      exec-once = [
        "waybar"
        "pipewire"
        "wireplumber"
        "pipewire-pulse"
        "xhost +SI:localuser:root"
      ];
      exec = [
        # "bash ~/test.sh"
      ];
      bind = [
        # Principal Keybinds
        "$mod, Return, exec, $term"
        "$mod, Q, killactive,"
        "$mod SHIFT, Q, exit,"
        "$mod, SPACE, exec, rofi -show combi"
        "$mod SHIFT, E, exec, swaylock"
        "$mod, F, fullscreen, 1"
        "$mod SHIFT, F, fullscreen, 0"
        "$mod, Y, pin"
        "$mod, V, togglefloating"
        "ALT, TAB, cyclenext"
        "ALT SHIFT, TAB, cyclenext, prev"
        "CTRL ALT, DELETE, exec, btop"

        # Workspaces
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"

        "$mod SHIFT, 1, movetoworkspacesilent, 1"
        "$mod SHIFT, 2, movetoworkspacesilent, 2"
        "$mod SHIFT, 3, movetoworkspacesilent, 3"
        "$mod SHIFT, 4, movetoworkspacesilent, 4"
        "$mod SHIFT, 5, movetoworkspacesilent, 5"

        # Pyprland
        "$mod SHIFT, L, exec, pypr attract_lost"
        "$mod SHIFT, V, exec, pypr toggle volume && hyprctl dispatch bringactivetotop"
        "$mod SHIFT, Return, exec, pypr toggle term"
        "$mod SHIFT, K, exec, pypr toggle keepassxc"

        # Screenshots
        ",Print, exec, grim -g '$(slurp)' - | convert  - -shave  1x1 PNG:- | wl-copy"
        "SHIFT, Print, exec, wl-paste | swappy -f -"
      ];
      bindm = [
        # Move/Resize windows with $mod and mouse
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
      windowrulev2 = [];
      input = {
        kb_layout = "us";
      };
      general = {
        gaps_in = 5;
        gaps_out = 5;
        border_size = 2;
        layout = "dwindle";
        "col.active_border" = "0xff${config.lib.stylix.colors.base01}";
        "col.inactive_border" = "0xff${config.lib.stylix.colors.base04}";
        resize_on_border = true;
      };
      group = {
        "col.border_active" = "0xff${config.lib.stylix.colors.base04}";
        "col.border_inactive" = "0xff${config.lib.stylix.colors.base01}";
        "col.border_locked_active" = "0xff${config.lib.stylix.colors.base04}";
      };
      decoration = {
        drop_shadow = false;
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          vibrancy = 0.1696;
        };
      };
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };
      misc = {
        force_default_wallpaper = 0;
        background_color = "0xff${config.lib.stylix.colors.base00}";
      };
    };
  };
}
