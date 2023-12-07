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

    nixvim = {
      url = "github:duuuuardo/nixvim";
    };

    hyprland = {
      url = "github:hyprwm/hyprland";
    };
  };
  
  outputs = { self, nixpkgs, ... } @ attrs: { 

    nixosConfigurations = {};
    templates.default = {
      path = ./.;
      description = "Template";
    };
  };
}
