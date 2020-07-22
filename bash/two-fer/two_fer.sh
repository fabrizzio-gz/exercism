#!/usr/bin/env bash
name="$1"
(( $# == 0 )) && name="you"
echo "One for ${name}, one for me."

