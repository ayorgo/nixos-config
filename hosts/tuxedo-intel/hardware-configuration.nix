# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "thunderbolt" "ahci" "nvme" "usb_storage" "usbhid" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  boot.initrd.luks.devices."luks-d2e1f5f9-3006-48ef-8dc1-13af7026e9d5".device = "/dev/disk/by-uuid/d2e1f5f9-3006-48ef-8dc1-13af7026e9d5";

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/5ca15056-2150-4ac9-933f-6bdc32d64868";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/064A-E3A1";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/d7dcb416-b4da-4d05-bdab-39cfce1aade5"; }
    ];

  # boot.initrd.luks.devices."arch_linux".device = "/dev/disk/by-uuid/d03baa4e-c594-48ae-9c86-6a9d97bfd671";

  # fileSystems."/media/another_ssd" =
  #   { device = "/dev/disk/by-uuid/8b64463d-9a97-433a-a3a7-11d00de7b09a";
  #     fsType = "ext4";
  #   };

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp44s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlo1.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
