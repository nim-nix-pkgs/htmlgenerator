{
  description = ''Generate HTML string by nim object'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs."htmlgenerator-master".dir   = "master";
  inputs."htmlgenerator-master".owner = "nim-nix-pkgs";
  inputs."htmlgenerator-master".ref   = "master";
  inputs."htmlgenerator-master".repo  = "htmlgenerator";
  inputs."htmlgenerator-master".type  = "github";
  inputs."htmlgenerator-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."htmlgenerator-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."htmlgenerator-v0_1_0".dir   = "v0_1_0";
  inputs."htmlgenerator-v0_1_0".owner = "nim-nix-pkgs";
  inputs."htmlgenerator-v0_1_0".ref   = "master";
  inputs."htmlgenerator-v0_1_0".repo  = "htmlgenerator";
  inputs."htmlgenerator-v0_1_0".type  = "github";
  inputs."htmlgenerator-v0_1_0".inputs.nixpkgs.follows = "nixpkgs";
  inputs."htmlgenerator-v0_1_0".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib"];
  in lib.mkProjectOutput {
    inherit self nixpkgs;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
    refs = builtins.removeAttrs inputs args;
  };
}