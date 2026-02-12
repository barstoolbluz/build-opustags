{
  description = "opustags — view and edit Ogg Opus comments";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        packages.default = pkgs.stdenv.mkDerivation rec {
          pname = "opustags";
          version = "1.10.1";

          src = pkgs.fetchFromGitHub {
            owner = "fmang";
            repo = "opustags";
            rev = version;
            hash = "sha256-0lo+4VMYXGwXUuRxU1xZRxzlUQ4o4n/CDHXDM27FK44=";
          };

          nativeBuildInputs = with pkgs; [
            cmake
            pkg-config
          ];

          buildInputs = with pkgs; [
            libogg
          ];

          meta = with pkgs.lib; {
            description = "View and edit Ogg Opus comments";
            homepage = "https://github.com/fmang/opustags";
            license = licenses.bsd3;
            mainProgram = "opustags";
          };
        };
      }
    );
}
