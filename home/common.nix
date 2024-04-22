{ lib, pkgs, ... }:

let
  OAuth2Settings = id: {
    "mail.smtpserver.smtp_${id}.authMethod" = 10;
    "mail.server.server_${id}.authMethod" = 10;
  };
in
{
  imports = [
    ./programs/firefox.nix
    ./programs/git.nix
    ./programs/gnome.nix
    ./programs/kitty.nix
    ./programs/neovim.nix
    ./services/watch-gnome-theme.nix
  ];

  home.username = "ayorgo";
  home.homeDirectory = "/home/ayorgo";

  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    spotify
    freetube
    fastfetch
    fzf
    ripgrep
  ];

  programs.thunderbird = {
    enable = true;
    profiles.default = {
      isDefault = true;
      settings = { };
    };
  };

  accounts.email.accounts = {
    gmail = {
      primary = true;
      flavor = "gmail.com";
      address = "george.adzhygai@gmail.com";
      realName = "Georgios Adzhygai";
      smtp.tls.useStartTls = true;
      thunderbird = {
        enable = true;
        settings = OAuth2Settings;
      };
    };
  };

  home.file = {
    ".bashrc" = {
      source = ./dotfiles/bash/.bashrc;
    };
    ".bash_aliases" = {
      source = ./dotfiles/bash/.bash_aliases;
    };
  };
}