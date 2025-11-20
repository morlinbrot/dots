# Best Practices for Setting Up an AI-first Monorepo

## CLAUDE.md

- Create a top-level `CLAUDE.md` file. Keep contents as concise as possible, describe repository structure and essential commands.
- Mention further Claude-specific docs like `.claude/agents`, `.claude/commands`, `.claude/scripts`, and `.claude/skills`.

## Subagents

- Create subagents [according to the official docs here](https://code.claude.com/docs/en/sub-agents#file-format)

## Skills

- Create skills according to the [official schema here](https://github.com/anthropics/skills/blob/main/skill-creator/SKILL.md)
- Keep skills focused on specific tasks, e.g. `.claude/skills/react-create-component` & `.claude/skills/react-tanstack-query`, not `.claude/skills/frontend-patterns`.

## "Usage Limit Hack"

Following the reasoning [here](https://www.reddit.com/r/ClaudeAI/comments/1oh95lh/claude_code_usage_limit_hack/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1)

- Create [`.claude/scripts/restrict.sh`](.claude/scripts/restrict.sh):

- Add PreTooluse hook to [`.claude/settings.json`](.claude/settings.json):

```json
{
  "hooks": {
    "PreToolUse": [
      { "matcher": "Bash", "hooks": [{ "type": "command", "command": "bash .claude/scripts/restrict.sh" }] }
    ]
  }
}
```

## MCP servers

### context7

3. Add entry to [`.mcp.json`](.mcp.json):

```json
{
  "mcpServers": {
    "context7": {
      "command": "npx",
      "args": ["-y", "@upstash/context7-mcp@latest"]
    }
  }
}
```

2. Add entry to [`.claude/settings.json`](.claude/settings.json):

```json
{
  "enabledMcpjsonServers": ["context7"]
}
```

3. Add guideline to `CLAUDE.md`

```md
Use the `context7` tool to search for documentation and best practices on external libraries & frameworks.
```

## Documentation Auto-Updater agent

- Create [`.claude/hooks/check-module-docs.sh`](.claude/hooks/check-module-docs.sh)

- Add Stop hook to [`.claude/settings.json`](.claude/settings.json):

```json
{
  "hooks": {
    "Stop": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "$CLAUDE_PROJECT_DIR/.claude/hooks/check-module-docs.sh",
            "timeout": 5000
          }
        ]
      }
    ]
  }
}
```
