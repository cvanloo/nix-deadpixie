{ pkgs ? import <nixpkgs> {} }:

let
  janetScript = builtins.path { path = ./dwmstatus.janet; };
in pkgs.stdenv.mkDerivation {
    pname = "dwmstatus";
    version = "1";
    src = ./dwmstatus.janet;
    nativeBuildInputs = [ pkgs.janet ];
    phases = [ "installPhase" ];
    installPhase = ''
      mkdir -p $out/bin
      cp ${janetScript} $out/bin/dwmstatus
      chmod +x $out/bin/dwmstatus
    '';
}
