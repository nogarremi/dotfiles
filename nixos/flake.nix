{
  description = "Flakes Initialization";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    waybar = {
      url = "github:Alexays/Waybar";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #swww = {
    #  url = "github:LGFae/swww";
    #  flake = false;
    #};
  };

  outputs = { self, nixpkgs, waybar, ... }@inputs: 
    let
      system = "x86_64-linux";
      packages =  import nixpkgs {
        overlays = [ waybar.overlay ];
	inherit system;
      };
    in
    {
      nixosConfigurations.default = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
	modules = [
	  ./hosts/default/configuration.nix
	  inputs.home-manager.nixosModules.default
        ];
      };
    };
}
