function fish_right_prompt
  set_color yellow
  rbenv version | awk '{print $1}'
end
