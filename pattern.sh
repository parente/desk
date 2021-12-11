#!/bin/bash
set -e

case $1 in
  "Pure White")
    program_id='HTQYdhMi2LMS9MSZd'
    ;;
  "Random Rotating Gradient")
    program_id='2mc3Yseqt7fGRJ3hh'
    ;;
  "Fixed Two Color Gradient")
    program_id='vHB8yPTJexLJ3Eqmr'
    ;;
  *)
    exit 1
    ;;
esac

echo '{"activeProgramId":"'${program_id}'"}' | websocat ws://pixelblaze_0efd28.lan:81/ -1