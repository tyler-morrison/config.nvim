---
name: commit
description: Crafts git commits following the Conventional Commits specification. Use when creating commits, writing commit messages, or staging and committing changes.
---

# Commit

Follow the [Conventional Commits 1.0.0](https://www.conventionalcommits.org/en/v1.0.0/#specification) specification for every commit.

## Format

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

## Types

| Type | When to use |
|------|-------------|
| `ai` | **Files that a coding agent will consume** — prompts, skills, CLAUDE.md, agent configs, MCP configs, system prompts |
| `feat` | New feature |
| `fix` | Bug fix |
| `docs` | Documentation only |
| `style` | Formatting, whitespace (no logic change) |
| `refactor` | Code restructure without feature/fix |
| `test` | Adding or updating tests |
| `chore` | Build process, tooling, dependencies |
| `perf` | Performance improvement |
| `ci` | CI/CD configuration |
| `revert` | Reverting a previous commit |

## Rules

- Description uses active voice, present tense ("adds", "fixes", "updates" — not "add" or "added"), lowercase, no trailing period
- Body wraps at 72 characters
- Breaking changes: append `!` after type/scope **and** add `BREAKING CHANGE:` footer
- Multiple footers separated by blank lines

## Examples

```
feat(auth): adds OAuth2 login flow

fix: prevents race condition in request queue

ai: updates CLAUDE.md with Ruby conventions

feat!: redesigns public API

BREAKING CHANGE: all endpoints now require versioned paths
```

## Workflow

1. Run `git diff --staged` to review what's staged
2. If nothing staged, identify relevant files and stage them
3. Select type — when in doubt between two types, prefer the more specific one
4. Write description in active voice, present tense
5. Add body only if the *why* isn't obvious from the description
6. Commit using a heredoc to preserve formatting:

```bash
git commit -m "$(cat <<'EOF'
type(scope): description

Optional body here.
EOF
)"
```
