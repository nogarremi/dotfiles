{ config, pkgs, ... }:

{
  programs.rofi = {
    enable = true;
    theme = "Monokai.rasi";
  };
}
