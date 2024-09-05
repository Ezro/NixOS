{ config, pkgs, ... }:
{
  home.stateVersion = "24.05";
  home.username = "hypr";
  home.homeDirectory = "/home/hypr";
  programs.home-manager.enable = true;
  programs.waybar ={
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        mod = "dock";
        height = 40;
        modules-left = ["hyprland/workspaces"];
        modules-center = ["clock" "wlr/taskbar"];
        modules-right = ["pulseaudio" "tray"];
        clock = {
          format = "{:%H:%M}  ";
        };
        network = {
          format-wired = "{ifname} {ipaddr}";
          format-wireless = "{ifname} {ssid} {bitrate}";
        };
        pulseaudio = {
          format = "{icon}   {volume}%";
          format-muted = "";
          on-click = "pavucontrol";
          on-click-right = "pavucontrol";
          on-scroll-up = "pactl set-sink-volume @DEFAULT_SINK@ +5%";
          on-scroll-down = "pactl set-sink-volume @DEFAULT_SINK@ +5%";
          scroll-step = 5;
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = ["" "" ""];
          };
        };
        tray = {
          icon-size = 32;
          spacing = 10;
        };
        "wlr/taskbar" = {
          format = "{icon}";
          icon-size = 32;
          spacing = 0;
          on-click-middle = "close";
          tooltip-format = "{title}";
          on-click = "activate";
        };
        "hyprland/workspaces" = {
          format = "{name}: {icon}";
          format-icons = {
		        "1" = "";
		        "2" = "";
		        "3" = "";
		        "4" = "";
		        "5" = "";
		        active = "";
		        default = "";
	        };
          persistent-workspaces = {
            DP-1 = [2];
            HDMI-A-1 = [1];
            "*" = [3 4 5];
          };
        };
      };
    };
    style = ''
    * {
        border: none;
        border-radius: 0;
        font-family: "CaskaydiaCove Nerd Font";
        font-weight: bold;
        font-size: 22px;
        min-height: 0;
    }
    window#waybar {
      background: rgba(0, 0, 0, 0);
      color: #cdd6f4;
    }
    #clock {
      background: #000000;
      opacity: 0.7;
      padding: 0px 10px;
      margin: 3px 0px;
      margin-top: 7px;
      border: 5px;
      border-radius: 10px;
      padding-right: 10px;
      padding-left: 10px;
    }
    #custom-launch_wofi,
    #custom-lock_screen,
    #custom-light_dark,
    #custom-power_btn,
    #custom-power_profile,
    #custom-weather,
    #custom-myhyprv,
    #window,
    #cpu,
    #disk,
    #custom-updates,
    #memory,
    #battery,
    #pulseaudio,
    #network,
    #tray,
    #temperature,
    #workspaces,
    #backlight {
      background: #000000;
      opacity: 0.7;
      padding: 0px 10px;
      margin: 3px 0px;
      margin-top: 7px;
      border: 0px;
    }
    #pulseaudio {
      color: #cdd6f4;
      border-left: 0px;
      border-right: 0px;
    }
    #tray{
      background: #000000;
      opacity: 0.7;
      padding: 0px 10px;
      margin: 3px 0px;
      margin-right: 5px;
      margin-top: 7px;
      border: 5px;
      border-radius: 10px;
      padding-right: 10px;
      padding-left: 10px;
    }
    #clock {
      background: #000000;
      opacity: 0.7;
      padding: 0px 10px;
      margin: 3px 0px;
      margin-top: 7px;
      border: 5px;
      border-radius: 10px;
      padding-right: 10px;
      padding-left: 10px;
      font-size: 36px;
    }
    #taskbar {
      background: #000000;
      opacity: 0.7;
      padding: 0px 10px;
      margin: 3px 0px;
      margin-top: 7px;
      border: 5px;
      border-radius: 10px;
      padding-right: 10px;
      padding-left: 10px;
    }
    #taskbar button {
      box-shadow: none;
	    text-shadow: none;
      padding: 0px;
      border-radius: 9px;
      margin-top: 3px;
      margin-bottom: 3px;
      padding-left: 3px;
      padding-right: 3px;
      color: #93cee9;
      animation: gradient_f 5s ease-in infinite;
      transition: all 0.5s cubic-bezier(.55,-0.68,.48,1.682);
    }
    #taskbar button:hover {
      background: #11111b;
      color: #cdd6f4;
    }
    #taskbar button.active {
      background: #93cee9;
      color: #ffffff;
      margin-left: 3px;
      padding-left: 10px;
      padding-right: 10px;
      margin-right: 3px;
      animation: gradient_f 20s ease-in infinite;
      transition: all 0.3s cubic-bezier(.55,-0.68,.48,1.682);
    }
    '';
  };
}
