{ config, pkgs, ... }:

let
  startupScript = pkgs.pkgs.writeShellScriptBin "bg_setter" ''
    ${pkgs.swww}/bin/swww init &

    sleep 0.3

    ${pkgs.swww}/bin/swww img /shared/Pictures/wallpapers/sf6_char_background.webp &
  '';
in
{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Permitted insecure packages
  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {

      # Get rid of Vaxry's terrible loli fantasy
      misc = {
        force_hypr_chan = false;
	disable_hyprland_logo = true;
	force_default_wallpaper = "0";
      };

      # Monitors
      monitor = [
        "DP-2, 3840x2160@119.91, 1920x0, 1"
        "DP-3, 1920x1080@60, 0x1080, 1"
        "HDMI-A-4, 1440x900@59.887, 5760x720, 1, transform,1"
        ",preferred,auto,auto"
      ];

      # Monitor Rules
      workspace = [
        "1, monitor:DP-2, default:true, persistent:true"
        "1, monitor:DP-2, default:true, persistent:true"
        "7, monitor:DP-3, default:true, persistent:true"
        "8, monitor:DP-3, default:true, persistent:true"
        "9, monitor:HDMI-A-4, default:true, persistent:true"
        "10, monitor:HDMI-A-4, default:true, persistent:true"
      ];

      # Inputs
      env = "XCURSOR_SIZE, 24";
      input = {
        kb_layout = "us";
	kb_variant = "colemak";
	follow_mouse = "1";

	touchpad = {
	  natural_scroll = false;
	  clickfinger_behavior = true;
	};
      };
      gestures = {
	workspace_swipe = true;
	workspace_swipe_invert = false;
	workspace_swipe_cancel_ratio = "0.2";
      };

      # Decoration
      general = {
	border_size = "2";
	"col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
	"col.inactive_border" = "rgba(595959aa)";
      };
      decoration = {
	rounding = "10";
	drop_shadow = true;
	shadow_range = "4";
	shadow_render_power = "3";
	"col.shadow" = "rgba(1a1a1ee)";
	blur = {
	  enabled = true;
	  size = "3";
	};
      };
      animation = {
	enabled = true;
	bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

	animation = [
	  "windows, 1, 7, myBezier"
	  "windowsOut, 1, 7, default, popin 80%"
	  "border, 1, 10, default"
	  "borderangle, 1, 8, default"
	  "fade, 1, 7, default"
	  "workspaces, 1, 6, default"
        ];
      };

      # Layout
      dwindle = {
	pseudotile = true;
	preserve_split = true;
      };

      # Exec
      ## Once
      exec-once = [
        "${pkgs.waybar}/bin/waybar"
        "${pkgs.sway-audio-idle-inhibit}/bin/sway-audio-idle-inhibit"
        "${pkgs.swayidle}/bin/swayidle timeout 300 \"${pkgs.swaylock}/bin/swaylock\" timeout 600 \"hyprctl dispatch dpms off\" resume \"hyprctl dispatch dpms on\" timeout 1800 \"hyprctl dispatch dpms on; systemctl suspend\" before-sleep \"${pkgs.swaylock}/bin/swaylock\""
	"${startupScript}/bin/bg_setter"

        ## Once - Special Apps
        "[workspace special:discord silent] ${pkgs.webcord}/bin/discord"
        "[workspace special:obsidian silent] ${pkgs.obsidian}/bin/obsidian"
        # "[workspace special:cider silent] cider"
        "[workspace special:steam silent] ${pkgs.steam}/bin/steam"
      ];

      # Keybinds
      "$mainMod" = "SUPER";
      bind = [
        # Window Management
        "$mainMod, P, pseudo, #dwindle"
	"$mainMod ALT, Space, togglefloating,"
	"$mainMod, S, togglesplit, #dwindle"
	"$mainMod, F, fullscreen"
	"$mainMod, left, workspace, e-1"
	"$mainMod, right, workspace, e+1"
        
	# Killing/Locking
	"$mainMod, Q, killactive"
	"$mainMod, CTRL, Escape, exec, ${pkgs.wlogout}/bin/wlogout"
	
	# Programs
	"$mainMod, Return, exec, ${pkgs.kitty}/bin/kitty"
	"$mainMod, Space, exec, ${pkgs.kitty}/bin/rofi -show drun"
	
	# Special Workspaces
	"$mainMod, grave, togglespecialworkspace"
        "$mainMod, F1, workspace, special:discord"
        "$mainMod, F2, workspace, special:obsidian"
        "$mainMod, F3, workspace, special:cider"
        "$mainMod, F4, workspace, special:steam"
        "$mainMod SHIFT, F1, movetoworkspace, special:discord"
        "$mainMod SHIFT, F2, movetoworkspace, special:obsidian"
        "$mainMod SHIFT, F3, movetoworkspace, special:cider"
        "$mainMod SHIFT, F4, movetoworkspace, special:steam"

	# VPN
	"$mainMod CTRL ALT, H, exec, [workspace special:vopono silent] ${pkgs.kitty}/bin/kitty -1 --class=vopono ${pkgs.vopono}/bin/vopono exec \"${pkgs.firefox}/bin/firefox -P fav_user\""
	"$mainMod ALT, H, workspace, special:fav_user"
	"$mainMod SHIFT, H, workspace, special:vopono"
	"$mainMod CTRL, H, movetoworkspace, special:fav_user"
      ]
      ++ (
        builtins.concatLists (builtins.genList (
	  x: let
	    ws = let
	      c = (x + 1) / 10;
	    in
	      builtins.toString (x + 1 - (c * 10));
	  in [
	    "$mainMod, ${ws}, workspace, ${toString (x + 1)}"
	    "$mainMod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
	  ]
	)
	10)
      );
      bindm = [
      	"$mainMod, mouse:272, movewindow"
	"$mainMod, mouse:273, resizewindow"
      ];
    };
  };
}
