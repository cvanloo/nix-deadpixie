{ pkgs }:

pkgs.stdenv.mkDerivation {
    pname = "dwmstatus";
    version = "1";
    src = ./dwmstatus.janet;
    nativeBuildInputs = [ pkgs.janet ];
    installPhase = ''
      runHook preInstall
      mkdir -p $out/bin
      cp dwmstatus.janet $out/bin/dwmstatus
      chmod +x $out/bin/dwmstatus
      runHook postInstall
    '';
}
