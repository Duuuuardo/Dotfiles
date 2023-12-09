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
      traveller =
      let system = "x86_64-linux";
      in nixpkgs.lib.nixosSystem {
	    specialArgs = {
          username = "eduardo";
          hostname = "traveller";
          hyprlandConfig = "laptop";
          nvidia_bool = "enabled";
	    inherit system;
      } // attrs;        
        modules = [
          ./.
          ./modules/virtualization
        ];
      };
    };

    templates.default = {
      path = ./.;
      description = "Template";
    };
  };
}
