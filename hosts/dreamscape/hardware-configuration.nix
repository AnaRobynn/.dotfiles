# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in {
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot = {
	  initrd.availableKernelModules = [ "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod" ];
	  initrd.kernelModules = [ ];
	  kernelModules = [ "kvm-amd" ];
	  extraModulePackages = [ ];
	  kernelPackages = unstable.linuxPackages_latest;
# kernelParams = [ "nomodeset" ];
  };

  modules.hardware = {
    audio.enable = true;
    bluetooth.enable = true;
    bluetooth.audio.enable = true;
    nvidia.enable = true;
    monitors.home.enable = true;
  };

  # CPU
  hardware.cpu.amd.updateMicrocode = true;

  fileSystems = {
	  "/" =
	  { device = "/dev/disk/by-uuid/90a9c72b-8334-4c50-8b41-1cafc2fb58b7";
		  fsType = "ext4";
	  };

	  "/home" =
	  { device = "/dev/disk/by-uuid/24de09c2-dab8-4b78-9a8c-237d89e3630d";
		  fsType = "ext4";
	  };

	  "/boot" =
	  { device = "/dev/disk/by-uuid/6CC4-D895";
		  fsType = "vfat";
	  };
  };
  swapDevices = [ ];
}