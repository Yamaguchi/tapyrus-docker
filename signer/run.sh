#!/bin/bash
set -eu
trap 'kill $(jobs -p)' EXIT

DELAY=5
CARGO="cargo"
LOG=/tmp/log/signer.log

tail -v -n0 -F "$LOG" &

export RUST_BACKTRACE=1
while :
do
	$CARGO build --release
  	$CARGO run --release -- $* 2>> "$LOG"
	echo "Restarting in $DELAY seconds..."
	sleep $DELAY
done
