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
    swaylock
    swayidle
    dunst
    waybar
    swww
    sway-audio-idle-inhibit
    pamixer
    wlogout
    rofi-wayland
    nerdfonts
    pipewire
    xdg-utils
    pywal
  ];

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
