#!/bin/bash
COMMAND=$(cat | jq -r'.tool_input.command')
BLOCKED="node_modules|.pnpm-store|l.env/__pycache_l
\.git/|dist/|build/"
if echo "$COMMAND" | grep -qE "$BLOCKED";
then
  exit 2
  echo "ERROR: Blocked directory pattern" >&2
fi
