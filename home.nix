{ config, pkgs, ... }:

let 
userConfig = builtins.fromTOML (builtins.readFile ./user.toml);
in
{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home = {
    username = userConfig.user;
    homeDirectory = userConfig.home;

    stateVersion = "23.11";

    packages = with pkgs; [
      stow
      graphviz
      # neovim
      # rustup
      lsd
      fnm
      lazygit
      fd
      # docker
      # java
      protobuf
      fswatch
      ripgrep
      gh
      glow
      jq
      parallel
      bat
      du-dust
      zig
      postgresql
      go
    ];

    file = {
    };

    sessionVariables = {
    };
  };

  programs = {

    zsh = {
        enable = true;
        enableAutosuggestions = true;
        enableCompletion = true;
        autocd = true;
        defaultKeymap = "emacs";
        syntaxHighlighting.enable = true;
        history = {
            extended = true;
            ignoreAllDups = true;
            share = true;
            expireDuplicatesFirst = true;
        };
        historySubstringSearch = {
            enable = true;
        };
        initExtra = (builtins.readFile ./.zshrc);
    };

    tmux = {
        enable = true;
        aggressiveResize = false;
        mouse = true;
        baseIndex = 1;
        keyMode = "vi";
        plugins = with pkgs; [
            tmuxPlugins.sensible
            tmuxPlugins.logging
        ];
        extraConfig = (builtins.readFile ./.tmux.conf);
    };

    fzf = {
        enable = true;
        enableZshIntegration = true;
        fileWidgetCommand = "fd --type f";
    };

    git = {
        enable = true;
        delta = {
            enable = true;
        };
        ignores = [
            "out"
        ];
        includes = [
        {
            contents = {
                push = {
                    autoSetupRemote = true;
                };
                rerere = {
                    enabled = true;
                };
                column.ui = "auto";
                branch.sort = "-committerdate";
                url = {
                    "ssh://git.amazon.com" = {
                    insteadOf = "https://git.amazon.com";
                    };
                };
                core = {
                    excludesfile = "~/.gitignore";
                };
            };
        }
        {
            condition = "gitdir:~/personal/";
            contents = {
                user = {
                    name = "Adnan Shaikh";
                    email = "adnan.shaikh1806@gmail.com";
                };
                github = {
                    user = "adyshake";
                };
                core = {
                    sshCommand = "ssh -i ~/.ssh/github-personal";
                };
            };
        }
        {
            condition = "gitdir:~/work/";
            contents = {
                user = {
                    name = "Adnan Shaikh";
                    email = "snadnan@amazon.com";
                };
            };
        }
        ];
    };

    neovim = {
        enable = true;
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;
 extraLuaConfig = (builtins.readFile ./init.lua);
    };

    # Let Home Manager install and manage itself.
    home-manager.enable = true;
  };
}