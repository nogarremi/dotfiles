{ config, pkgs, ... }:

{
  imports = [
    ./hyprland.nix
    ./rofi.nix
    ./swaylock.nix
    ./waybar.nix
    ./wlogout.nix
  ];

  home.stateVersion = "23.11"; # Please read the comment before changing.

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "nogarremi";
  home.homeDirectory = "/home/nogarremi";

  home.keyboard = {
    layout = "us";
    variant = "colemak";
  };

  systemd.user.tmpfiles.rules = [
    "L /home/nogarremi/git/ - - - - /git/nogarremi/"
    "L /home/nogarremi/Downloads/ - - - - /shared/Downloads"
    "L /home/nogarremi/Documents/ - - - - /shared/Documents"
    "L /home/nogarremi/Pictures/ - - - - /shared/Pictures"
    "L /home/nogarremi/.config/nvim/init.lua - - - - /git/nogarremi/GitHub/dotfiles/neovim/init.lua"
  ];

  programs.git = {
    enable = true;
    aliases = {
      co = "checkout";
      sw = "switch";
      br = "branch";
    };
    userName = "Nogarremi";
    userEmail = "nogarremi@nogarremi.com";
  };

  programs.kitty = {
    shellIntegration.enableZshIntegration = true;
  };

  services.ssh-agent.enable = true;

  home.sessionVariables = {
    EDITOR = "nvim";
  };
}
