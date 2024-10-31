{
  programs.yt-dlp = {
    enable = true;

    settings = {
      embed-thumbnail = true;
    };

    # extraConfig = ''
    #   --update
    #   -f mp4
    #   -o ~/media/temp/%(title)s.%(ext)s
    # '';
  };
}
