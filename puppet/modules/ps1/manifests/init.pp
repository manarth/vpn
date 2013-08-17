# -*- mode: puppet -*-
# vi: set ft=puppet :

define ps1($prompt, $user) {
  exec { "append /home/$user/.profile":
    command => "echo 'PS1=\"$prompt\"' | cat >> /home/$user/.profile",
    unless => "grep 'PS1' /home/$user/.profile",
  }
}
