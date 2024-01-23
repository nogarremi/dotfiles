{ pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    steam
    mangohud
    gamescope
    gamemode
    lutris-unwrapped
  ];
}
