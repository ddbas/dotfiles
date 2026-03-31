#!/usr/bin/env bash

# Configure Claude Code MCP servers (user scope)

echo "Configuring Claude Code MCP servers..."

claude mcp add-json --scope user chrome '{
  "command": "npx",
  "args": ["chrome-devtools-mcp@latest", "--headless", "--no-usage-statistics"]
}'

claude mcp add-json --scope user playwright '{
  "command": "npx",
  "args": ["@playwright/mcp@latest"]
}'

echo "Done."
