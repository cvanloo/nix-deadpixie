{ pkgs }:

pkgs.stdenv.mkDerivation {
  pname = "berkeley-mono-typeface";
  version = "2.10.93";
  src = ../fonts/berkeley-mono.zip;
  unpackPhase = ''
    runHook preUnpack
    ${pkgs.unzip}/bin/unzip $src
    runHook postUnpack
  '';
  installPhase = ''
    runHook preInstall
    install -Dm644 berkeley-mono-v2/*.otf -t $out/share/fonts/OTF
    runHook postInstall
  '';
}
