#!/bin/bash
set -eu
trap 'kill $(jobs -p)' EXIT

DELAY=5
LOG=/tmp/log/electrs.log
CARGO="cargo"

tail -v -n0 -F "$LOG" &

export RUST_BACKTRACE=1
while :
do
	$CARGO check --release
	$CARGO run --release -- $* 2>> "$LOG"
	echo "Restarting in $DELAY seconds..."
	sleep $DELAY
done
