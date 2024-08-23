{ lib
, pkgs
, buildPythonPackage
, fetchFromGitHub
, python
}:

buildPythonPackage rec {
  pname = "strictjson";
  version = "git";

  src = fetchFromGitHub {
    owner = "tanchongmin";
    repo = "strictjson";
    rev = "32d7ec139d40b481ea345107a03516258903f8d3";
    sha256 = "sha256-KSjjQPhYA3ZsQ8hgGuvRduDbFgBaR1qY0Uq4sjqfIqs=";
  };

  build-system = [ python.pkgs.setuptools ];
  pyproject = true;

  patches = [
    ./0001-fix-for-Multiple-top-level-packages-discovered-in-a-.patch
  ];

  dependencies = with python.pkgs; [
  ];

  pythonImportsCheck = [
    "strictjson"
  ];
}
