{ pkgs, lib }:

let
  janetScript = builtins.path { path = ./dwmstatus.janet; };
in pkgs.stdenv.mkDerivation {
    pname = "dwmstatus";
    version = "1";
    src = ./dwmstatus.janet;
    buildInputs = [ pkgs.janet ];
    nativeBuildInputs = [ pkgs.makeWrapper ];
    phases = [ "installPhase" ];
    installPhase = ''
      mkdir -p $out/bin
      cp ${janetScript} $out/bin/dwmstatus
      chmod +x $out/bin/dwmstatus
      wrapProgram $out/bin/dwmstatus --prefix PATH : ${lib.makeBinPath [ janet ]}
    '';
}
