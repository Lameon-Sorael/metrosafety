# ChatGPT(H) development setup

This project treats the current ChatGPT(H) conversation as one of the development clients.

## What connects it to the project

The connection point is the GitHub repository.

ChatGPT(H) should work from:
- the same repository
- the same active PRs
- `AGENTS.md`
- `PROJECT.md`
- `docs/AI-HANDOFF.md`
- CI results and review comments

This means important project state must live in GitHub rather than only in chat history.

## Capabilities

Depending on the ChatGPT product surface and the connected GitHub tooling, repository access may be read-only or may expose write actions.

When write actions are available, ChatGPT(H) may:
- create/update files
- create branches and commits
- inspect or comment on PRs
- apply small fixes
- maintain project handoff documentation

When write actions are not available:
- inspect/review the repository
- produce an exact implementation plan or patch
- assign implementation to Codex Cloud or local Codex
- verify the resulting GitHub diff afterward

Never report a write, commit, push, test, or merge as completed unless it was actually verified.

## Start of a development conversation

Ask H to:
```text
Use the connected GitHub repository as the source of truth.
Read AGENTS.md, PROJECT.md, and docs/AI-HANDOFF.md first.
Inspect the active branch/PR and current CI/review status.
Do not merge to main without G's explicit approval.
```

## Recommended responsibility split

```text
ChatGPT(H) Dev
  architecture / review / small repository edits / coordination
        │
        ├── GitHub ── CI ── Grok review
        │
Codex Cloud
  larger cloud implementation / automated tests
        │
Local Codex
  local runtime / device / LAN / USB / desktop integration
```

The three development clients should exchange state through GitHub, not by assuming their chat transcripts are synchronized.

## Parallel work

Avoid simultaneous edits to one branch.

Use separate branches when work is parallel, for example:
```text
h/architecture-fix
codex/cloud-feature
codex/local-device-test
```

Then integrate through a PR after review.
