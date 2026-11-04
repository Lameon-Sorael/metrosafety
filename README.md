# AI Project Template

ChatGPT(H) + Codex Cloud + 로컬 Codex + GitHub Actions + Grok Bot을 하나의 GitHub 저장소 기준으로 연결해 쓰기 위한 개인용 AI 개발 템플릿입니다.

## 새 프로젝트 시작

1. GitHub에서 이 저장소의 **Use this template**로 새 저장소를 만듭니다.
2. `PROJECT.md`를 새 프로젝트 내용에 맞게 수정합니다.
3. Codex Cloud에서 새 저장소를 선택해 환경을 생성하고 게시합니다.
4. 로컬 Codex를 쓸 PC에서는 같은 저장소를 clone하고 작업 브랜치를 checkout합니다.
5. ChatGPT(H) 개발 대화는 GitHub 연결을 통해 같은 저장소/PR을 읽고, 이 환경에서 쓰기 권한이 허용되면 파일·커밋·PR 작업까지 수행합니다.
6. Codex Cloud와 로컬 Codex 모두 `AGENTS.md`, `PROJECT.md`, `docs/AI-HANDOFF.md`를 먼저 읽게 합니다.
7. Grok에서 프로젝트 전용 대화방/Routine을 만들고 Webhook URL/Key를 발급합니다.
8. 새 GitHub 저장소의 Actions Secrets에 아래 두 값을 등록합니다.
   - `GROK_BOT_WEBHOOK_URL`
   - `GROK_BOT_WEBHOOK_KEY`
9. feature branch에서 개발하고 PR을 엽니다.
10. GitHub CI와 Grok 리뷰를 확인한 뒤, 최종 병합은 G가 승인합니다.

자세한 절차:
- `docs/NEW-PROJECT-CHECKLIST.md`
- `docs/CODEX-CLOUD-SETUP.md`
- `docs/CHATGPT-DEV-SETUP.md`
- `docs/MULTI-CLIENT-WORKFLOW.md`
- `docs/GROK-SETUP.md`

## 기본 구조

```text
G
├─ ChatGPT(H) Dev: 설계·구현·GitHub 수정·PR 리뷰
├─ Codex Cloud: 클라우드 구현/테스트
├─ Local Codex: 내 PC 구현/실행/기기 연동
└─ GitHub
   ├─ CI
   └─ Grok PR Webhook
      └─ Grok Bot
         ├─ MetroDev
         ├─ MetroQA
         └─ Story Maker
```

## 원칙

- `main` 직접 개발 금지. feature branch + PR 사용.
- G의 명시적 승인 전 `main` 병합 금지.
- Secrets/API key를 코드, 로그, PR 본문에 넣지 않기.
- 확인하지 않은 테스트 결과나 성능 수치를 사실처럼 기록하지 않기.
- 실기기/외부 서비스처럼 Codex 환경에서 검증할 수 없는 항목은 **미검증**으로 명시.

## 템플릿 저장소 설정

이 원본 저장소에서는 GitHub **Settings → General → Template repository**를 켜두세요.

## 중요한 연결 원리

각 AI의 **대화 내용 자체가 자동 동기화되는 것은 아닙니다.**
대신 아래 항목이 공통 작업 상태입니다.

- GitHub repository
- branch / commit / PR
- `AGENTS.md`
- `PROJECT.md`
- `docs/AI-HANDOFF.md`

따라서 ChatGPT(H) 개발 대화, Codex Cloud, 로컬 Codex, Grok이 서로 다른 대화방/컴퓨터를 사용해도 같은 GitHub 상태를 읽으면 작업을 이어갈 수 있습니다.

동일 브랜치를 Codex Cloud와 로컬 Codex가 동시에 수정하지 않는 것을 권장합니다. 병렬 작업은 별도 feature branch로 나눕니다.
