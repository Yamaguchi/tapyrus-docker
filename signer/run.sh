#!/bin/bash
set -eu
trap 'kill $(jobs -p)' EXIT

DELAY=5
CARGO="cargo"
LOG=/tmp/signer.log

touch "$LOG"
tail -v -n0 -F "$LOG" &

export RUST_BACKTRACE=full
while :
do
	$CARGO build --release
  	$CARGO run --bin tapyrus-signerd --release -- $* 2>> "$LOG"
	echo "Restarting in $DELAY seconds..."
	sleep $DELAY
done
