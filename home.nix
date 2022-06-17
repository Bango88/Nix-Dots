{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "finleyv";
  home.homeDirectory = "/home/finleyv";
    
  nixpkgs.config.allowUnfree = true;  

  home.packages = with pkgs; [
    # Development/text editors
    vscode
    neovim
    emacs

    python3
    nodejs
    cmake
    rust-analyzer
    rustup

    # Utils/cli misc.
    pfetch
    btop
    rsync
    rclone
    git
    gh
    unzip
    exa

    # Gaming
    steam
    steam-run
    polymc
    discord
    betterdiscordctl

    # School
    teams
    obsidian
    notion

    # Gnome theming and settings
    gnome3.gnome-tweaks
    gnome-themes-extra
    catppuccin-gtk

    # Misc
    blender
    davinci-resolve
  ];
  
  nixpkgs.overlays = [(self: super: { discord = super.discord.overrideAttrs (_: { src = builtins.fetchTarball https://discord.com/api/download/stable?platform=linux&format=tar.gz; });})];


  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Start emacs server
  services.emacs.enable = true;

  programs.zsh = {
    enable = true;
    shellAliases = {
      ll = "ls -l";
      update = "home-manager switch";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "robbyrussell";
    };
  };

  programs.fish.enable = true;

  home = {
    sessionPath = ["/home/finleyv/.emacs.d/bin"];
  };

  programs.git = {
    enable = true;
    userName = "Finley Vickers";
    userEmail = "fvickers05@gmail.com";
  };

}
