{ pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  environment.systemPackages = with pkgs; [
    neovim
    obsidian
    pyenv
    git
    firefox
    vopono
    wireguard-tools
    zip
    yubico-pam
    yubikey-manager
    _1password-gui
    xfce.thunar
    xfce.thunar-volman
    xfce.thunar-archive-plugin
    audacity
    webcord
  ];
}
