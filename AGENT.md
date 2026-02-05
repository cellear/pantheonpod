# Agent Handoff Protocol

A lightweight, tool-agnostic system for maintaining context across AI coding sessions.

## The Problem

AI coding assistants (Claude Code, OpenCode, Gemini CLI, Cursor, etc.) lose context between sessions. You start fresh each time, re-explaining the project state, what you tried yesterday, and what's still broken.

Teams face this at scale: multiple developers, multiple AI tools, no shared memory.

## The Solution

Two directories. One naming convention. Zero vendor lock-in.

```
your-project/
├── HANDOFF/          # Session journals (what happened, chronological)
├── DOC/ or DOCS/     # Reference docs (persistent knowledge, by topic)
└── ...
```

That's it. The AI reads these on session start. You update them on session end. Context survives.

## The Protocol

### HANDOFF Directory

Chronological session documents for agent-to-agent (or agent-to-human) context sharing.

**Filename format:** `handoff-[yyyy-mm-dd]-[task]-[agent-or-author].md`

- No spaces in filenames
- Examples:
  - `handoff-2026-01-20-auth-bug-claude-sonnet.md`
  - `handoff-2026-01-21-api-refactor-gemini.md`
  - `handoff-2026-01-22-review-jane.md`

**Contents should include:**
- Tasks attempted (what you set out to do)
- Approaches tried (what worked, what didn't)
- Current state (where things stand now)
- Open questions (unresolved issues)
- Key learnings (insights worth preserving)
- References to relevant DOC files
- References to prior handoffs that informed this session

### DOC/DOCS Directory

Subject-organized reference documents for persistent project knowledge. Unlike handoffs, these aren't session-specific—they're living documents about how things work.

Examples:
- `architecture.md` - System design decisions
- `deployment.md` - How to deploy, environment details
- `api-patterns.md` - Conventions used in the codebase
- `troubleshooting.md` - Known issues and solutions

### Session Workflow

**Starting a session:**
1. Review recent files in `HANDOFF/` to understand current state
2. Consult relevant documents in `DOC/`
3. Summarize context before diving into work

**Ending a session:**
1. Create or update today's handoff document
2. Capture what was done, what's pending, any blockers
3. Update DOC files if you learned something persistent

## Adoption

Add this to your project's AI instructions file:

- **Claude Code:** `CLAUDE.md`
- **OpenCode:** `AGENTS.md`
- **Gemini CLI:** `.gemini/styleguide.md` or project instructions
- **Cursor:** `.cursorrules`
- **Generic:** Any file your tool reads for project context

### Sample Instructions Block

```markdown
## Agent Handoff Workflow

This project uses a structured handoff system for continuity between sessions.

### Starting a Session

1. Review recent files in `HANDOFF/` to understand current state
2. Consult relevant documents in `DOC/`
3. Present a concise summary to the user
4. Ask what they want to work on next

### Ending a Session

Before concluding, create a handoff document capturing the session's work
to maintain continuity for the next session.

### Handoff Document Format

**Filename:** `handoff-[yyyy-mm-dd]-[task]-[agent-or-author].md`

**Include:**
- Tasks attempted and their outcomes
- Approaches tried (what worked, what didn't)
- Current state and any blockers
- Open questions
- References to related DOC files and prior handoffs
```

## Why This Works

- **No tools required** - Just markdown files in your repo
- **No vendor lock-in** - Works with any AI assistant that reads project files
- **Human-readable** - Developers can read and write these too
- **Git-friendly** - Version controlled, diff-able, reviewable
- **Scales naturally** - From solo projects to teams

## Optional: Git Workflow Integration

For teams that want commits to include handoff updates:

```markdown
### Commit Guidelines

- Every commit should include an updated handoff doc for the current day
- If no handoff doc exists for today, create one
- If one exists, update it to include the work in this commit
```

## Contributing

This is a convention, not a tool. If you have improvements, open an issue or PR. Keep it simple.

## License

MIT - Use it however you want.
