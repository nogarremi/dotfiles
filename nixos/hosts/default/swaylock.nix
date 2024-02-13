{ config, pkgs, ... }:

{
  programs.swaylock = {
    enable = true;
    settings = {
      daemonize = true;
      no-unlock-indicator = true;
      color = "80808088";
    };
  };
}
