{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    systemd.target = "hyprland-session.target";
    settings = {
      horiMons = {
        layer = "top";
        output = [
          "DP-2"
	  "DP-3"
        ];
        passthrough = false;
        height = 0;
        margin-top = 2;
        margin-left = 5;
        spacing = 0;

        modules-left = [
          "wlr/taskbar"
	  "hyprland/window"
        ];
        modules-center = [
	  "hyprland/workspaces"
        ];
        modules-right = [
          "tray"
	  "group/quicklinks"
	  "battery"
	  "network"
  	  "pulseaudio"
	  "clock"
	  "custom/exit"
        ];

        # Quick Links
        "group/quicklinks" = {
          orientation = "horizontal";
	  modules = [
	    "custom/fileexplorer"
	    "custom/firefox"
	  ];
        };

        # Modules
        ## Taskbar
        "wlr/taskbar" = {
          format  = "{icon}";
	  icon-size = 18;
	  tooltip-format = "{title}";
	  on-click = "activate";
	  on-click-middle = "close";
	  rewrite = {
	    "Firefox Web Browser" = "Firefox";
	    "Foot Server" = "Terminal";
	  };
        };

        ## Hyprland Windows
        "hyprland/window" = {
          format = "{}";
	  max-length = 25;
        };

        ## Hyprland Workspaces
        "hyprland/workspaces" = {
          disable-scroll = true;
	  all-outputs = true;
	  format = "";
	  format-icons = {
	    urgent = "";
	    active = "";
	    default = "";
	  };
	  on-click = "activate";
        };

        ## Tray
        "tray" = {
          spacing = 5;
        };
        ## File Explorer 
        "custom/fileexplorer" = {
          format = "";
	  on-click = "thunar";
        };

        ## Firefox
        "custom/firefox" = {
	  format = "";
	  on-click = "firefox";
        };

        ## Battery
        "battery" = {
          states = {
            good = 95;
            warning = 30;
            critical = 20;
          };
          format = "{icon}  {capacity}%";
          format-charging = " {capacity}%";
          format-plugged = " {capacity}%";
          format-alt = "{time} {icon}";
          format-icons = [
	    ""
	    ""
	    ""
	    ""
	    ""
	    ""
	  ];
        };

        ## Network
        "network" = {
	  format = "{ifname}";
	  format-wifi = "{essid} ({signalStrength}%) ";
	  format-ethernt = "";
	  format-disconnected = "Disconnected";
	  on-click = "nmtui";
        };

        ## Audio
        "pulseaudio" = {
          format = "{icon} {volume}%";
          tooltip = false;
          format-muted = " Muted";
          on-click = "pamixer -t";
	  on-scroll-up = "pamixer -i 5";
	  on-scroll-down = "pamixer -d 5";
	  format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [
	      ""
	      ""
	      ""
	    ];
          };
        };

        ## Clock
        "clock" = {
          format = "{: %R   %Y-%m-%d}";
        };

        ## WLogout
        "custom/exit" = {
          format = "";
	  on-click = "wlogout";
        };
      };
      vertMons = {
        layer = "top";
        output = [
          "HDMI-A-4"
        ];
        passthrough = false;
        height = 0;
        margin-top = 2;
        margin-left = 5;
        spacing = 0;
 
        modules-left = [
          "wlr/taskbar"
	  "hyprland/window"
        ];
        modules-center = [
	  "hyprland/workspaces"
        ];
        modules-right = [
          "tray"
	  "group/quicklinks"
	  "battery"
	  "network"
  	  "pulseaudio"
	  "clock"
	  "custom/exit"
        ];

        # Quick Links
        "group/quicklinks" = {
          orientation = "horizontal";
	  modules = [
	    "custom/fileexplorer"
	    "custom/firefox"
	  ];
        };

        # Modules
        ## Taskbar
        "wlr/taskbar" = {
          format  = "{icon}";
	  icon-size = 18;
	  tooltip-format = "{title}";
	  on-click = "activate";
	  on-click-middle = "close";
	  rewrite = {
	    "Firefox Web Browser" = "Firefox";
	    "Foot Server" = "Terminal";
	  };
        };

        ## Hyprland Windows
        "hyprland/window" = {
          format = "{}";
	  max-length = 25;
        };

        ## Hyprland Workspaces
        "hyprland/workspaces" = {
          disable-scroll = true;
	  all-outputs = true;
	  format = "";
	  format-icons = {
	    urgent = "";
	    active = "";
	    default = "";
	  };
	  on-click = "activate";
        };

        ## Tray
        "tray" = {
          spacing = 5;
        };
        ## File Explorer 
        "custom/fileexplorer" = {
          format = "";
	  on-click = "thunar";
        };

        ## Firefox
        "custom/firefox" = {
	  format = "";
	  on-click = "firefox";
        };

        ## Battery
        "battery" = {
          states = {
            good = 95;
            warning = 30;
            critical = 20;
          };
          format = "{icon}  {capacity}%";
          format-charging = " {capacity}%";
          format-plugged = " {capacity}%";
          format-alt = "{time} {icon}";
          format-icons = [
	    ""
	    ""
	    ""
	    ""
	    ""
	    ""
	  ];
        };

        ## Network
        "network" = {
	  format = "{ifname}";
	  format-wifi = "{essid} ({signalStrength}%) ";
	  format-ethernt = "";
	  format-disconnected = "Disconnected";
	  on-click = "nmtui";
        };

        ## Audio
        "pulseaudio" = {
          format = "{icon} {volume}%";
          tooltip = false;
          format-muted = " Muted";
          on-click = "pamixer -t";
	  on-scroll-up = "pamixer -i 5";
	  on-scroll-down = "pamixer -d 5";
	  format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [
	      ""
	      ""
	      ""
	    ];
          };
        };

        ## Clock
        "clock" = {
          format = "{: %R   %Y-%m-%d}";
        };

        ## WLogout
        "custom/exit" = {
          format = "";
	  on-click = "wlogout";
        };
      };
    }; 
    style = '' 
/*
 * __        __          _                  ____  _         _       
 * \ \      / /_ _ _   _| |__   __ _ _ __  / ___|| |_ _   _| | ___  
 *  \ \ /\ / / _` | | | | '_ \ / _` | '__| \___ \| __| | | | |/ _ \ 
 *   \ V  V / (_| | |_| | |_) | (_| | |     ___) | |_| |_| | |  __/ 
 *    \_/\_/ \__,_|\__, |_.__/ \__,_|_|    |____/ \__|\__, |_|\___| 
 *                 |___/                              |___/         
 *  
 * by Stephan Raabe (2023) 
 * ----------------------------------------------------- 
*/

/* -----------------------------------------------------
 * Import Pywal colors 
 * ----------------------------------------------------- */
/* @import 'style-light.css'; */

/* -----------------------------------------------------
 * General 
 * ----------------------------------------------------- */

* {
    font-family: "Fira Sans Semibold", FontAwesome, Roboto, Helvetica, Arial, sans-serif;
    border: none;
    border-radius: 0px;
}

window#waybar {
    background-color: rgba(0,0,0,0.8);
    border-bottom: 0px solid #ffffff;
    /* color: #FFFFFF; */
    background: transparent;
    transition-property: background-color;
    transition-duration: .5s;
}

/* -----------------------------------------------------
 * Workspaces 
 * ----------------------------------------------------- */

#workspaces {
    background: @workspacesbackground2;
    margin: 2px 1px 3px 1px;
    padding: 0px 1px;
    border-radius: 15px;
    border: 0px;
    font-weight: bold;
    font-style: normal;
    opacity: 0.6;
    font-size: 16px;
    color: @textcolor1;
}

#workspaces button {
    padding: 0px 5px;
    margin: 4px 3px;
    border-radius: 15px;
    border: 0px;
    background-color: @workspacesbackground3;
    transition: all 0.3s ease-in-out;
    opacity: 0.6;
}

#workspaces button.active {
    background: @workspacesbackground1;
    border-radius: 15px;
    min-width: 40px;
    transition: all 0.3s ease-in-out;
    opacity: 0.8;
}

#workspaces button.active:hover {
    background: @workspacesbackground4;
    opacity: 1.0;
}

#workspaces button:hover {
    background: @workspacesbackground3;
    opacity: 1.0;
}

/* -----------------------------------------------------
 * Tooltips
 * ----------------------------------------------------- */

tooltip {
    border-radius: 0px;
    background-color: @backgroundlight;
    opacity:0.8;
    padding:0px;
    margin:0px;
}

tooltip label {
    color: @textcolor2;
}

/* -----------------------------------------------------
 * Window
 * ----------------------------------------------------- */

#window {
    background: @backgroundlight;
    margin: 5px 15px 5px 0px;
    padding: 2px 10px 0px 10px;
    border-radius: 12px;
    color:@workspaces2;
    font-size:16px;
    font-weight:normal;
    opacity:0.8;
}

window#waybar.empty #window {
    background-color:transparent;
}

/* -----------------------------------------------------
 * Taskbar
 * ----------------------------------------------------- */

#taskbar {
    /* background: @color11; */
    background: @backgroundlight;
    margin: 3px 15px 3px 0px;
    padding:0px;
    /*padding: 2px 3px 1px 3px;*/
    border-radius: 15px;
    font-weight: normal;
    font-style: normal;
    opacity:0.8;
    border: 3px solid @workspacesbackground4;
}

#taskbar button {
    margin:0;
    border-radius: 15px;
    padding: 0px 5px 0px 5px;
}


/* -----------------------------------------------------
 * Tray
 * ----------------------------------------------------- */

#tray {
    /* background: @color11; */
    background: @backgrounddark;
    margin: 3px 15px 3px 0px;
    /*padding:0px;*/
    padding: 2px 3px 1px 3px;
    border-radius: 20px;
    font-weight: normal;
    font-style: normal;
    opacity:0.8;
    border: 3px solid @workspacesbackground4;
}

/* -----------------------------------------------------
 * Modules
 * ----------------------------------------------------- */

.modules-left > widget:first-child > #workspaces {
    margin-left: 0;
}

.modules-right > widget:last-child > #workspaces {
    margin-right: 0;
}

/* -----------------------------------------------------
 * Custom Quicklinks
 * ----------------------------------------------------- */

#custom-firefox, #custom-fileexplorer {
    margin-right: 20px;
    font-size: 20px;
    font-weight: bold;
    opacity: 0.8;
    color: @workspacesbackground4;
    /*text-shadow:
        1px 0 0 @textcolor1,
        0 1px 0 @textcolor1,
	-1px 0 0 @textcolor1,
	0 -1px 0 @textcolor1;*/
}

/* -----------------------------------------------------
 * Custom Modules
 * ----------------------------------------------------- */

#custom-rofi {
    background-color: @backgrounddark;
    font-size: 16px;
    color: @textcolor1;
    border-radius: 15px;
    padding: 0px 10px 0px 10px;
    margin: 3px 15px 3px 14px;
    opacity:0.8;
    border:3px solid @bordercolor;
}

/* -----------------------------------------------------
 * Custom Exit
 * ----------------------------------------------------- */

#custom-exit {
    margin: 0px 20px 0px 0px;
    padding:0px;
    font-size:20px;
    color: red;
}

/* -----------------------------------------------------
 * Hardware Group
 * ----------------------------------------------------- */

#disk,#memory,#cpu {
    margin:0px;
    padding:0px;
    font-size:16px;
    color:@iconcolor;
}

#memory {
    margin-right:10px;
}

/* -----------------------------------------------------
 * Clock
 * ----------------------------------------------------- */

#clock {
    background-color: @backgrounddark;
    font-size: 16px;
    color: @workspacesbackground4;
    border-radius: 15px;
    padding: 1px 10px 0px 10px;
    margin: 3px 15px 3px 0px;
    opacity:0.8;
    border:3px solid @workspacesbackground4;   
}

/* -----------------------------------------------------
 * Pulseaudio
 * ----------------------------------------------------- */

#pulseaudio {
    background-color: @backgroundlight;
    font-size: 16px;
    color: @workspacesbackground4;
    border-radius: 15px;
    padding: 2px 0px 0px 0px;
    margin: 5px 15px 5px 0px;
    opacity:0.8;
    /*text-shadow:
        1px 0 0 @textcolor1,
        0 1px 0 @textcolor1,
	-1px 0 0 @textcolor1,
	0 -1px 0 @textcolor1;*/
}

#pulseaudio.muted {
    background-color: @backgrounddark;
    color: @workspacesbackground4;
}

/* -----------------------------------------------------
 * Network
 * ----------------------------------------------------- */

#network {
    background-color: @backgroundlight;
    font-size: 16px;
    color: @workspacesbackground4;
    border-radius: 15px;
    padding: 2px 0px 0px 0px;
    margin: 5px 15px 5px 0px;
    opacity:0.8;
    /*text-shadow:
        1px 0 0 @textcolor1,
        0 1px 0 @textcolor1,
	-1px 0 0 @textcolor1,
	0 -1px 0 @textcolor1;*/
}

#network.ethernet {
    background-color: @backgroundlight;
    color: @workspacesbackground4;
}

#network.wifi {
    background-color: @backgroundlight;
    color: @workspacesbackground4;
}

/* -----------------------------------------------------
 * Bluetooth
 * ----------------------------------------------------- */

#bluetooth.on, #bluetooth.connected {
    background-color: @backgroundlight;
    font-size: 16px;
    color: @textcolor2;
    border-radius: 15px;
    padding: 2px 10px 0px 10px;
    margin: 5px 15px 5px 0px;
    opacity:0.8;
}

#bluetooth.off {
    background-color: transparent;
    padding: 0px;
    margin: 0px;
}

/* -----------------------------------------------------
 * Battery
 * ----------------------------------------------------- */

#battery {
    background-color: @backgroundlight;
    font-size: 16px;
    color: @textcolor2;
    border-radius: 15px;
    padding: 2px 15px 0px 10px;
    margin: 5px 15px 5px 0px;
    opacity:0.8;
}

#battery.charging, #battery.plugged {
    color: @textcolor2;
    background-color: @backgroundlight;
}

@keyframes blink {
    to {
        background-color: @backgroundlight;
        color: @textcolor2;
    }
}

#battery.critical:not(.charging) {
    background-color: #f53c3c;
    color: @textcolor3;
    animation-name: blink;
    animation-duration: 0.5s;
    animation-timing-function: linear;
    animation-iteration-count: infinite;
    animation-direction: alternate;
}

/* -----------------------------------------------------
 * Other
 * ----------------------------------------------------- */

label:focus {
    background-color: #000000;
}

#network {
    background-color: #2980b9;
}

#network.disconnected {
    background-color: #f53c3c;
}

/* -----------------------------------------------------
 * Import Pywal colors 
 * ----------------------------------------------------- */

@define-color backgroundlight @color5;
@define-color backgrounddark @color11;
@define-color workspacesbackground1 #DFC5FE;
@define-color workspacesbackground2 #A48CC1;
@define-color workspacesbackground3 #7F60A6;
@define-color workspacesbackground4 #EFE2FF;
@define-color bordercolor @color11;
@define-color textcolor1 #FFFFFF;
@define-color textcolor2 #FFFFFF;
@define-color textcolor3 #FFFFFF;
@define-color iconcolor #FFFFFF;
    '';
  };
}
