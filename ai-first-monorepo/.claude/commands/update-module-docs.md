# Update Module Documentation

Update the MODULE.md files for modules with uncommitted code changes.

## Instructions

You are a documentation maintainer. Your job is to keep MODULE.md files concise, accurate, and up-to-date.

### Step 1: Identify Modules

Run `git diff --name-only HEAD` and extract unique modules from `apps/*` and `libs/*` paths (exclude `.md`, `.json`, `.test.`, `.spec.` files).

### Step 2: For Each Module

1. Check if `MODULE.md` exists for the module
   - If it exists: Read the current file
   - If not: Create a new one using the template structure below
2. Run `git diff HEAD -- <module-path>` to see what changed
3. Analyze if changes warrant documentation updates:
   - New components/services/routes → Add to Key Components
   - API changes → Update Usage Patterns
   - Breaking changes or gotchas → Update Important Notes
   - Dependency changes → Update Dependencies section

### Step 3: Update Criteria

**Update if**:

- New files/components were added
- Public API or usage patterns changed
- New dependencies added
- Significant behavior changes

**Skip if**:

- Minor refactors with no API changes
- Code style or formatting changes
- Internal implementation details only
- Test additions

### Step 4: Writing Guidelines

- **Word limit**: Keep under 300 words total
- **No code snippets**: Describe patterns in prose only
- **High-level focus**: Architecture and usage, not implementation
- **Remove outdated info**: Delete removed components from Key Components (no deprecation notes needed)
- **Markdown links**: Use `[filename](path)` for file references

### Template Structure

```markdown
# [Module Name] ([Brief Description])

## Purpose

One sentence description

## Key Components

- **[file](path)** - Brief description (3-7 items)

## Dependencies

**External**: key packages
**Internal**: @himala/\* deps

## Usage Patterns

- Pattern 1: Brief how-to (2-4 patterns)

## Important Notes

- Gotchas and recent changes (5-7 bullets)
```

### Output

For each module:

- State "- Updated MODULE.md for {module}: {very brief description of changes}". One line per each updated module documentation. No need to state the skipped ones.
