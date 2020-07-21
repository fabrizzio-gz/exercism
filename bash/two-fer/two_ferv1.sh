#!/usr/bin/env bash
name="$@"
if [ -n "$name" ]; then
    echo "One for ${name}, one for me."
else
    echo "One for you, one for me."
fi

