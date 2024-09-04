{ pkgs, ... }:
{
  programs.alacritty = {
    enable = true;
    settings = {
      env.TERM = "xterm-256color";
      window.padding = {
        x = 24;
        y = 24;
      };
      window.decorations = "none";
      window.opacity = 0.7;
      scrolling.history = 1000;
      font = {
        normal = {
          family = "Jetbrains Mono";
          style = "Regular";
        };
        bold = {
          family = "Jetbrains Mono";
          style = "Bold";
        };
        italic = {
          family = "Jetbrains Mono";
          style = "Italic";
        };
        size = 12;
      };
      shell.program = "zsh";
    };
  };
}
