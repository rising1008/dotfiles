# If the shell is a login shell,
# commands are read from /etc/zprofile and then $ZDOTDIR/.zprofile.
#

if [ -d "${HOME}/bin" ] ; then
  PATH="${HOME}/bin:${PATH}"
fi

if [ -d "${HOME}/man" ]; then
  MANPATH="${HOME}/man:${MANPATH}"
fi

if [ -d "${HOME}/info" ]; then
  INFOPATH="${HOME}/info:${INFOPATH}"
fi

eval "$(pyenv init --path)"
