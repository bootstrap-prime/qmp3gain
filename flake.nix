{
  description = "qmp3gain";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-21.11";

  outputs = { self, nixpkgs }: let
    pkgs = (import nixpkgs {
      system = "x86_64-linux";
    });
  in {
    defaultPackage.x86_64-linux = pkgs.appimageTools.wrapType2  {
      name = "qmp3gain";
      # version = "0.9.2";

      src = pkgs.fetchurl {
        url = "mirror://sourceforge/qmp3gain/0.9.2/qmp3gain-0.9.2-linux-x64.AppImage";
        sha256 = "sha256-Gl+4DY35cabMg/LYIb/Qv0DVbkj1wPI9lM2PtJTslGw=";
      };

      extraPkgs = pkgs: with pkgs; [ aacgain vorbisgain mp3gain ];
    };

  };
}
