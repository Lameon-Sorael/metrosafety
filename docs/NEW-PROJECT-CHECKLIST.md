# New project checklist

## 1. GitHub
- Create a new repository using **Use this template**.
- Edit `PROJECT.md`.
- Confirm `AGENTS.md` and workflows exist.
- Keep `main` as the protected/stable branch conceptually; do development on feature branches.

## 2. Codex Cloud
- Create a Cloud Environment for the new repository.
- Let onboarding detect dependencies.
- Save and Publish the environment.
- Start a new cloud task.
- Tell Codex to read `AGENTS.md`, `PROJECT.md`, and `docs/AI-HANDOFF.md`.
- Verify the current branch before editing.

## 3. Local Codex
- Clone the same GitHub repository on the development PC.
- Fetch before starting: `git fetch origin`.
- Checkout the intended feature branch.
- Read `AGENTS.md`, `PROJECT.md`, and `docs/AI-HANDOFF.md`.
- Pull before editing and push commits when the task is ready for shared review.
- Do not work on the exact same branch concurrently with Codex Cloud.

## 4. ChatGPT / H
- Keep the GitHub connector enabled for the repository.
- Ask H to inspect the repository/PR instead of copying code between chats.
- Record architecture decisions and verified milestones in `docs/AI-HANDOFF.md` so Codex sessions can resume them.
- Treat GitHub as the source of truth; chat content is supporting context, not the synchronization mechanism.

## 5. Grok project room
- Create a new project-specific Grok conversation/group.
- Reuse the existing specialist bots if appropriate.
- Create a project-specific PR review Routine/Webhook.
- Obtain the webhook URL and key.

## 6. GitHub Secrets
Register under **Settings → Secrets and variables → Actions**:
- `GROK_BOT_WEBHOOK_URL`
- `GROK_BOT_WEBHOOK_KEY`

Never commit these values.

## 7. Smoke test
- Create a feature branch.
- Make a harmless documentation change.
- Open a PR.
- Confirm:
  - AI Project CI runs.
  - Grok webhook workflow returns HTTP 200.
  - Grok review appears for the PR.

## 8. Development loop
```text
H design/review ─┐
Codex Cloud ─────┼─→ GitHub branch / PR
Local Codex ─────┘
                         ↓
      ├─ CI
      └─ Grok review
           ↓
H review / feedback
           ↓
Codex fix
           ↓
G final approval
           ↓
merge
```
