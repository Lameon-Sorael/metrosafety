# Codex Cloud setup

## Create the environment
1. Open Codex Cloud settings.
2. Create a new environment.
3. Select the new GitHub repository.
4. Let Cloud Environment Onboarding inspect the repository.
5. Review install/start commands.
6. Save and Publish the environment.

## First task
Use a feature branch, not `main`.

Suggested first instruction:

```text
Read AGENTS.md, PROJECT.md, and docs/AI-HANDOFF.md first.
Confirm the current branch and HEAD.
Run the repository verification script before changing code.
Report verified status and risks.
Do not merge to main.
```

## Standard verification
```bash
bash scripts/verify-project.sh
```

The script detects common Node/Python projects and runs safe baseline checks. Project-specific commands in `PROJECT.md` take priority when they differ.

## Handoff discipline
After a substantial change, update `docs/AI-HANDOFF.md` with:
- branch/PR
- verified functionality
- test results
- known risks
- next tasks
