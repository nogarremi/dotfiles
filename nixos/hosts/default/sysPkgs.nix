{ pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  programs.hyprland.enable = true;
  programs.zsh.enable = true;

  # Permitted insecure packages
  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];

  # List packages installed in system profile. To search, run:
  environment.systemPackages = with pkgs; [
    neovim
    open-vm-tools
    webcord
    obsidian
    steam
    mangohud
    gamescope
    pyenv
    _1password-gui
    vmware-workstation
    xfce.thunar
    xfce.thunar-volman
    xfce.thunar-archive-plugin
    zsh
    kitty
    audacity
    blueman
    cloudflared
    firefox
    nerdfonts
    zig
    lutris-unwrapped
    yubico-pam
    yubikey-manager
    vopono
    swww
    sway-audio-idle-inhibit
    gamemode
    waybar
    dunst
    rofi-wayland
    git
  ];
}
