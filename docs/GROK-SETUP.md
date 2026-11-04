# Grok Bot project setup

Use a separate Grok project conversation for each software project so context does not mix across repositories.

## Suggested team
- Grok Bot: overall PR review and delegation
- MetroDev: implementation/code review
- MetroQA: tests, security, regressions
- Story Maker: verified development record

Bots may be reused across projects; the project conversation and Routine/Webhook should be project-specific.

## Routine purpose
When GitHub sends PR metadata:
1. identify repository, PR number, SHA, and branch
2. inspect the PR changes
3. review without silently merging
4. delegate specialist review if configured
5. publish verified findings
6. keep G as final merge approver

## Required GitHub Secrets
```text
GROK_BOT_WEBHOOK_URL
GROK_BOT_WEBHOOK_KEY
```

The included `.github/workflows/grok-pr-review.yml` sends only PR metadata. It does not send repository secrets.

## Security default
The workflow only sends secrets for:
- same-repository PRs, and
- PRs authored by the repository owner.

If a future organization/team repository needs trusted collaborators or a bot actor, intentionally change that condition after reviewing the security impact.

## Test the connection
Open or update a PR and inspect the workflow:
`AI PR → Grok Bot webhook`

Expected result:
`Webhook HTTP status: 200`
