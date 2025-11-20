#!/bin/bash
# Stop hook - triggers /update-module-docs if code in apps/ or libs/ was modified

# Consume stdin (required)
cat > /dev/null

# Check if we already triggered update-module-docs in this session
marker_file="/tmp/claude-module-docs-updated"
if [ -f "$marker_file" ]; then
  # Already updated docs in this session, don't trigger again
  rm -f "$marker_file"
  exit 0
fi

# Check git diff for modified code files in apps/ or libs/
# Exclude MODULE.md, README.md, tests, and config files
modules=$(git diff --name-only HEAD 2>/dev/null | \
  grep -E '^(apps|libs)/' | \
  grep -vE '(MODULE\.md|README\.md|\.test\.|\.spec\.|\.json$|\.md$)' | \
  cut -d'/' -f1,2 | \
  sort -u | \
  tr '\n' ' ')

[ -z "$modules" ] && exit 0

# Create marker so we don't trigger again after updating docs
touch "$marker_file"

# Block Claude from stopping and tell it to update module docs
cat <<EOF
{
  "decision": "block",
  "reason": "IMPORTANT: Code was modified in modules: ${modules}. Before you can stop, you MUST invoke the /update-module-docs slash command using the SlashCommand tool. This will update the MODULE.md documentation files for the affected modules."
}
EOF
