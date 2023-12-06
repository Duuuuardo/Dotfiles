{
  description = "Duardo NixOS configuration files!";
  
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    agenix = {
	url = "github:ryantm/agenix";
	inputs.nixpkgs.follows = "nixpkgs";
	inputs.darwin.follows = "";
    };

    hyprland = {
      url = "github:hyprwm/hyprland";
    };
  };
  
  outputs = { self, nixpkgs, ... } @ attrs: { 

    nixosConfigurations = { 
      traveler =
      let system = "x86_64-linux";
      in nixpkgs.lib.nixosSystem {
	specialArgs = {
          username = "eduardo";
          hostname = "traveler";
          hyprlandConfig = "laptop";
          nvidia_bool = "enabled";
	  inherit system;
        } // attrs;        
        modules = [
          ./.
          ./modules/toys
          ./modules/virt
        ];
      };
    };
    templates.default = {
      path = ./.;
      description = "The default template for this flake";
    };
  };
}
