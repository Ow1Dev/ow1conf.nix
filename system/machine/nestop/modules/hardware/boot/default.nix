{...}: {
  boot = {
    loader = {
      grub.enable = true;
      grub.device = "/dev/disk/by-id/nvme-KINGSTON_SNV2S1000G_50026B7785AA4846"; # Install GRUB to the NVMe drive
    };
  };
}
