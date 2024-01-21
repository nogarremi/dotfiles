{ lib, config, pkgs, ... }:

let
  cfg = config.my_user;
in
{
  options.my_user = {
    enable = lib.mkEnableOption "Enable users module";

    userName = lib.mkOption {
      default = "nogarremi";
      description = ''
        Username of user
      '';
    };
  };

  config = lib.mkIf cfg.enable {
    users.users.${cfg.userName} = {
      isNormalUser = true;
      extraGroups = [ "networkmanager" "wheel" ];
      shell = pkgs.zsh;
    };
  };
}
