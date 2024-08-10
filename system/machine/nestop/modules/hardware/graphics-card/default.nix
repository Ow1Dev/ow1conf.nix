{config, ...}: {
  boot.kernelParams = ["nvidia-drm.fbdev=1"];
  hardware.opengl.enable = true;
  services.xserver.videoDrivers = ["nvidia"];


  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    forceFullCompositionPipeline = true;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}
