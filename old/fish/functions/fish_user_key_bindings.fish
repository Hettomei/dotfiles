function fish_user_key_bindings
  fish_vi_key_bindings

  bind -m insert o force-repaint
  # bind -m insert o "commandline -a (echo ' \\\ ok'; echo '')[1] "

  bind -M insert \ca beginning-of-line
  bind -M insert \ce end-of-line
end
