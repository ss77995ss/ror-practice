#!/bin/bash

if [ $RAILS_ENV == production ]; then
  rails server -b 0.0.0.0
else
  # rails server -b 0.0.0.0
fi
