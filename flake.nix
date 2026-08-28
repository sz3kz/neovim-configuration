{
  description = "Neovim Configuration Environment Flake";

  inputs = {          
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      # Supported: Linux Intel / AMD, Linux ARM, MacOS Intel, Apple Silicon MacOS
      supportedArchitectures = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ]; 

      forAllSystems = nixpkgs.lib.genAttrs supportedArchitectures;

      nixpkgsFor = forAllSystems (system: import nixpkgs { 
        inherit system; 
        config.allowUnfree = true; 
      });
      
    in
    {
      devShells = forAllSystems (system:
        let 
          pkgs = nixpkgsFor.${system}; 
        in {
          default = nixpkgsFor.${system}.mkShell {
            nativeBuildInputs = [
              pkgs.lua-language-server
            ];
            shellHook = ''
              echo "🚀 Neovim Configuration Environment Loaded!"
              echo "  • LSP: $(lua-language-server --version)"
            '';
          };
      });
      packages = forAllSystems (system: {
        default = nixpkgsFor.${system}.stdenv.mkDerivation {
          src = ./.;
        };
      });
    };
}
