{ pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  hardware.opengl = { 
    driSupport = true;
    driSupport32Bit = true;
    extraPackages = with pkgs; [
      intel-ocl
      intel-gmmlib
    ];
    extraPackages32 = with pkgs; [
      intel-ocl
      intel-gmmlib
    ];
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  environment.systemPackages = with pkgs; [
    steam
    mangohud
    gamescope
    gamemode
    lutris
    wine
    winetricks
    protonup-ng
    freetype
    glxinfo
    clinfo
    vulkan-tools
  ];
}
