# Multi-client workflow

This template is designed so one project can be worked on from several AI surfaces without copying entire chat histories.

## Shared source of truth

The connection point is **GitHub**, not direct AI-to-AI chat synchronization.

```text
                 G
                 │
        decisions / final approval
                 │
    ┌────────────┼──────────────┐
    │            │              │
ChatGPT(H) Dev  Codex Cloud    Local Codex
    │            │              │
    └────────────┼──────────────┘
                 │
          GitHub repository
       branches / commits / PRs
                 │
        ┌────────┴────────┐
        │                 │
       CI          Grok webhook
                           │
                       Grok team
```

The following persist context across clients:
- code and tests
- branches and commits
- pull requests and review comments
- `AGENTS.md`
- `PROJECT.md`
- `docs/AI-HANDOFF.md`

Chat transcripts are **not automatically synchronized**.

## ChatGPT(H) development client

The current ChatGPT(H) conversation is a development client, not only a planning chat.

When the connected GitHub tool grants the required repository actions, H may:
- inspect current code, branches, commits, and PR state
- design architecture
- create or update repository files
- create commits/branches/PR comments where supported
- review Codex changes
- apply small trusted fixes
- compare Grok/CI feedback
- keep G as final merge approver

Repository capabilities can differ by ChatGPT surface or connection. If write actions are unavailable, H should still review/design from GitHub and hand implementation to Codex instead of pretending the write occurred.

When a decision matters to future sessions, put it in `PROJECT.md`, an ADR, a PR, or `docs/AI-HANDOFF.md`.

## Codex Cloud

Use for:
- longer implementation tasks
- clean cloud execution
- tests/builds independent of the local PC
- work that should continue from any device

Before work:
```bash
git branch --show-current
git status
```

Read the repository instructions before editing.

## Local Codex

Use for:
- local app execution
- device/USB/LAN testing
- desktop/mobile integration
- files or tools available only on the development PC

Typical setup:
```bash
git clone <REPO_URL>
cd <REPO>
git fetch origin
git switch <FEATURE_BRANCH>
git pull --ff-only
```

After verified work:
```bash
git status
git add <files>
git commit -m "<message>"
git push
```

Once pushed, H and Codex Cloud can inspect the same commit.

## Parallel work rule

Do **not** let Codex Cloud and local Codex modify the same branch at the same time.

Preferred pattern:
```text
main
├─ codex/cloud-feature-a
├─ codex/local-device-test
└─ h/architecture-fix
```

Each task becomes a PR or is intentionally integrated into one active PR.

## Handoff rule

After a meaningful milestone, update `docs/AI-HANDOFF.md` with:
- current branch / PR
- verified behavior
- exact test result
- device/manual test result
- unresolved risks
- next priority

This file is the compact project memory that lets a new AI session resume without replaying the full conversation.

## Grok review

Grok is connected through GitHub PR events. It does not need access to Codex or H chat history.

It receives PR metadata from the workflow, reads the repository/PR, and posts review feedback. That feedback then becomes visible to H, Codex Cloud, and local Codex through GitHub.
