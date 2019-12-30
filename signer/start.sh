#!/bin/bash
set -eu
trap 'kill $(jobs -p)' EXIT

DELAY=5
CARGO="cargo"

export RUST_BACKTRACE=1
while :
do
	$CARGO build --release
  $CARGO install --force --path . 
	./target/release/node $*
	echo "Restarting in $DELAY seconds..."
	sleep $DELAY
done
