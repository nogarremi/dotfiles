{ pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
    ];
  };

  environment.systemPackages = with pkgs; [
    xdg-desktop-portal-hyprland
    polkit
    polkit_gnome
    pam_u2f
    swaylock
    swayidle
    dunst
    waybar
    sway-audio-idle-inhibit
    pamixer
    pulseaudio
    alsa-scarlett-gui
    wlogout
    rofi-wayland
    nerdfonts
    line-awesome
    pipewire
    xdg-utils
    pywal
    swww
    appimage-run
  ];

  security.pam = {
    u2f.cue = true;
    services = {
      login.u2fAuth = true;
      sudo.u2fAuth = true;
      swaylock = {
        u2fAuth = true;
      };
    };
  };

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = ["Terminus"]; } )
  ];

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
}
