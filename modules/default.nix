{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./options.nix
      ./xdg.nix
      ./desktop
      ./editors
      ./shell
      ./services
      ./themes
    ];
}
