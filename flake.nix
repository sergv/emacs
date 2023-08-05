{
  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs";
    };
    flake-utils = {
      url = "github:numtide/flake-utils";
    };
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
          # name = "linux-scripts";

          nativeDeps = [
            # pkgs.gtk3
            # pkgs.pango
            # pkgs.cairo

            pkgs.zlib
          ];

      in {
        devShell = pkgs.mkShell {

          buildInputs = nativeDeps;

          nativeBuildInputs = [
            pkgs.gdb
            pkgs.pkg-config
            pkgs.makeWrapper
            pkgs.autoreconfHook
            pkgs.texinfo
            pkgs.wrapGAppsHook
            pkgs.ncurses
            # pkgs.gconf
            pkgs.libxml2
            pkgs.gnutls
            pkgs.alsa-lib
            pkgs.acl
            pkgs.gpm
            pkgs.gettext
            pkgs.jansson
            pkgs.harfbuzz.dev
            # pkgs.dbus
            # pkgs.libselinux
            # pkgs.systemd
            pkgs.freetype
            # pkgs.fontconfig
            # pkgs.xorg.xorgproto
            # pkgs.xorg.libX11
            # pkgs.xorg.libXt
            # pkgs.xorg.libXft
            # pkgs.xorg.libXext
            # pkgs.xorg.libSM
            # pkgs.xorg.libICE
            pkgs.xorg.libXaw
            # pkgs.xorg.Xaw3d
            pkgs.xorg.libXpm
            pkgs.libpng
            pkgs.libjpeg
            # pkgs.giflib
            # pkgs.libtiff
            pkgs.xorg.libXft
            # pkgs.gconf
            pkgs.cairo
            pkgs.librsvg
            pkgs.libotf
            pkgs.gtk3-x11
            pkgs.gsettings-desktop-schemas
            # pkgs.webkitgtk
            # pkgs.glib-networking

            pkgs.tree-sitter
          ] ++ map (x: if builtins.hasAttr "dev" x then x.dev else x) nativeDeps;

          # LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath nativeDeps;

          # # Add executable packages to the nix-shell environment.
          # packages = [
          #   # hpkgs.ghc
          #   # hpkgs.cabal-install
          #   pkgs.zlib
          # ];

          # Add build dependencies of the listed derivations to the nix-shell environment.
          # inputsFrom = [ pkgs.hello pkgs.gnutar ];

          # ... - everything mkDerivation has
        };
      });
}
