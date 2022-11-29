# You can use this file as a nixpkgs overlay. This is useful in the
# case where you don't want to add the whole NUR namespace to your
# configuration.
{
  ci ? true,
  lib,
  inputs,
  ...
}: _final: prev: let
  isReserved = n: n == "lib" || n == "overlays" || n == "modules";
  nameValuePair = n: v: {
    name = n;
    value = v;
  };
  nurAttrs = import ./default.nix {
    pkgs = prev;
    inherit ci lib inputs;
  };
in
  builtins.listToAttrs (map (n: nameValuePair n nurAttrs.${n})
    (builtins.filter (n: !isReserved n) (builtins.attrNames nurAttrs)))
