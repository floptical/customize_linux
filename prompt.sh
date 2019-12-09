#!/bin/bash

if [ $EUID -eq 0 ]; then
  export PS1="[\[\e[31m\]\u\[\e[m\]@\[\e[34m\]\h\[\e[m\]:\[\e[35m\]\W\[\e[m\]]-\[\e[42m\]\A\[\e[m\] \$ "
else
  export PS1="[\[\e[35m\]\u\[\e[m\]@\[\e[34m\]\h\[\e[m\]:\[\e[35m\]\W\[\e[m\]]-\[\e[42m\]\A\[\e[m\] \$ "
fi


