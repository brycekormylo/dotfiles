{
  programs.tmux = {
    enable = true;
    historyLimit = 2000;
    # keyMode = "vi";
    disableConfirmationPrompt = true;
    # plugins = with pkgs; [
    #   tmuxPlugins.vim-tmux-navigator
    # ];
    extraConfig = ''
      unbind C-b
      set-option -g prefix C-a
      bind-key C-a send-prefix

      set-option -g allow-rename off

      set-option -g status on
      set-option -g status-style fg=magenta,bg=black
      set-option -g status-right ""

      bind -n M-Left select-pane -L
      bind -n M-Right select-pane -R
      bind -n M-Up select-pane -U
      bind -n M-Down select-pane -D

      bind -n M-1 select-window -t 1
      bind -n M-2 select-window -t 2
      bind -n M-3 select-window -t 3
      bind -n M-4 select-window -t 4

      bind -n M-q kill-session

      # don't do anything when a 'bell' rings
      set -g visual-activity off
      set -g visual-bell off
      set -g visual-silence off
      setw -g monitor-activity off
      set -g bell-action none

      # clock mode
      setw -g clock-mode-colour yellow

      # copy mode
      setw -g mode-style 'fg=black bg=red bold'

      # panes
      set -g pane-border-style 'fg=red'
      set -g pane-active-border-style 'fg=yellow'

      set -g base-index 1
      setw -g pane-base-index 1

      # statusbar
      set -g status-position bottom
      set -g status-justify right
      set -g status-style 'fg=magenta,bg=black'

      # set -g status-left ""
      set -g status-left-length 10

      setw -g window-status-current-style 'fg=blue bg=black'
      setw -g window-status-current-format ' #W '
      # setw -g window-status-current-format ' #I #W #F '

      setw -g window-status-style 'fg=magenta bg=black'
      setw -g window-status-format '#[fg=magenta]#W '
      # setw -g window-status-format ' #I #[fg=magenta]#W #[fg=magenta]#F '

      setw -g window-status-bell-style 'fg=yellow bg=magenta bold'

      # messages
      set -g message-style 'fg=yellow bg=magenta bold'
    '';
  };
}
# Use terminal colors, check ./kitty.nix for reference

