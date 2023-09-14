{ pkgs, ... }:
{
  imports = [
    ./nix.nix
    ./doas.nix
    ./sway.nix
    ./zsh
   #./tlp.nix
    ./apps.nix
    ./nerworking.nix
    ./fonts.nix
    ./gnome.nix
    ./flatpak.nix
    ./deepin.nix
    ./gdm.nix
   #./pantheon.nix
    ./kde.nix 
   #./dwm.nix
  ];

  users.users.demine = {
    isNormalUser = true;
    description = "Demine";
    extraGroups = [
      "wheel"
      "disk"
      "docker"
      "audio"
      "adbusers"
      "input"
      "video"
      "libvirtd"
      "systemd-journal"
      "networkmanager"
      "plugdev"
    ];
  };

  i18n.defaultLocale = "ru_RU.UTF-8";
  console = {
    #font = "ter-v16n";
    keyMap = "ru";
  };

  time.timeZone = "Europe/Moscow";

  users.defaultUserShell = pkgs.zsh;
  nix.settings.trusted-users = [ "root" "demine" ];
  services.openssh.enable = true;
  hardware.opengl.driSupport32Bit = true;
  services.printing.enable = true;
  # Don't wait for network startup
  systemd = {
    targets.network-online.wantedBy = pkgs.lib.mkForce [];
    services.NetworkManager-wait-online.wantedBy = pkgs.lib.mkForce [];
  };
}
