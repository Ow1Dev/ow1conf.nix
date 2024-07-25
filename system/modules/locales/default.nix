{ lib
, config
, ...
}:

with lib;

let
  cfg = config.module.locales;
in {
  options = {
    module.locales.enable = mkEnableOption "Enables locales";
  };

  config = mkIf cfg.enable {
    # Locale settings
    i18n = {
      defaultLocale = "da_DK.UTF-8";
      extraLocaleSettings = {
        LC_ADDRESS = "da_DK.UTF-8";
        LC_IDENTIFICATION = "da_DK.UTF-8";
        LC_MEASUREMENT = "da_DK.UTF-8";
        LC_MONETARY = "da_DK.UTF-8";
        LC_NAME = "da_DK.UTF-8";
        LC_NUMERIC = "da_DK.UTF-8";
        LC_PAPER = "da_DK.UTF-8";
        LC_TELEPHONE = "da_DK.UTF-8";
        LC_TIME = "da_DK.UTF-8";
      };
    };
  };
}

