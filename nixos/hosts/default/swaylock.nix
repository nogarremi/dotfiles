{ config, pkgs, ... }:

{
  programs.swaylock = {
    enable = true;
    settings = {
      daemonize = true;
      color = "80808088";
    };
  };
}
