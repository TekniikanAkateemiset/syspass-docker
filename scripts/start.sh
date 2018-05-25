#!/bin/bash

# Run custom scripts
if [ -d "/scripts/" ]; then
  # make scripts executable incase they aren't
  chmod -Rf 750 /scripts/*; sync;
  # run scripts in number order
  for i in `ls /scripts/`; do /scripts/$i ; done
else
  echo "Can't find script directory"
fi

# Start services.
/bin/s6-svscan /etc/services.d
