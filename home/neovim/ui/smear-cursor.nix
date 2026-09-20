{
  programs.nixvim = {
    plugins.smear-cursor = {
      enable = true;
      settings = {
          stiffness = 0.9;               
          trailing_stiffness = 0.6;      
          distance_stop_animating = 0.5; 
          trailing_exponent = 2;
          slowdown_exponent = -0.2;
          smear_to_cmd = false;
          legacy_computing_symbols_support = true;
          hide_target_hack = false;
          smear_between_buffers = true;
          smear_insert_mode = false;
          distance_stop_animating_vertical_bar = 0.1;
          cursor_color = "#A7D6AA";
      };
    };
  };
}
