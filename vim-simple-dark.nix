{ pkgs }:

pkgs.vimUtils.buildVimPlugin {
  pname = "simple-dark";
  version = "latest";
  src = pkgs.fetchFromGitHub {
    owner = "tek256";
    repo = "simple-dark";
    rev = "main";
    sha256 = "";
  };
}
