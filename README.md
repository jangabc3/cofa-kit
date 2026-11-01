# cofa-kit

현업 담당자의 짧은 요청을 받아 AI 코딩 에이전트(Codex)로 시제품을 만드는 과제용 작업 키트입니다.
정답 코드나 템플릿은 없습니다. 묻고, 합의하고, 계획하고, 검증하고, 기록하고, 내가 만든 것을 설명할 수 있게 되는 **과정**만 돕습니다.

## 설치 (작업 폴더에서)
```bash
git clone https://github.com/jangabc3/cofa-kit ~/cofa-kit
bash ~/cofa-kit/install.sh .
```
Codex에게 "jangabc3/cofa-kit 깃허브에서 받아서 지금 폴더에 설치해 줘"라고 해도 됩니다.
- 스킬 10개가 `~/.agents/skills/`에 들어갑니다.
- 작업 폴더에 `AGENTS.md`(작업 규칙)와 `COFA_STEPS.md`(작업 순서)가 생깁니다. 이미 `AGENTS.md`가 있으면 `AGENTS.kit.md`로 둡니다.
- Codex를 다시 켜고 `/skills`로 `cofa-` 스킬이 보이는지 확인합니다.

## 작업 순서
에디터에서 **`COFA_STEPS.md`**를 열고 위에서부터 따라가세요. 단계마다 Codex와 담당자에게 보낼 말이 들어 있습니다.
헷갈리면 Codex에 `다음 뭐 해야 돼?`(`$cofa-next`) 또는 `$cofa-steps`라고 하세요.

## 스킬
| 스킬 | 언제 | 남기는 파일 |
|---|---|---|
| `$cofa-interview` | 시작 직후, 담당자 답을 받을 때마다 | `INTERVIEW.md` |
| `$cofa-agreement` | 질문을 마친 뒤 | `AGREEMENT.md` (+ 담당자 확인 메시지) |
| `$cofa-plan` | 합의 뒤, 코드 전 (방식은 내가 고름) | `PLAN.md`, `FLOW.md` |
| `$cofa-decisions` | 무언가를 정하거나 AI 결과를 고칠 때 | `DECISIONS.md` |
| `$cofa-ux` | 핵심 기능이 된 뒤 | 화면 수정, `DECISIONS.md`의 `[화면]` |
| `$cofa-verify` | 끝났다고 말하기 전 | `VERIFICATION.md`, `tests/` |
| `$cofa-handoff` | 세션을 바꿀 때, 마무리할 때 | `.handoff/SESSION.md`, `HANDOFF.md` |
| `$cofa-explain` | 마무리 전 | `EXPLAIN.md` (내 작업 설명 노트) |
| `$cofa-next` | 다음 할 일을 모를 때 | `.cofa/START` (시작 시각) |
| `$cofa-steps` | 지금 단계만 보고 싶을 때 | - |

## 안 될 때
| 증상 | 이렇게 |
|---|---|
| `/skills`에 `cofa-`가 안 보임 | Codex를 껐다 켠다. 그래도 없으면: `~/cofa-kit/.agents/skills/cofa-interview/SKILL.md 읽고 그대로 따라 해 줘` (스킬 이름만 바꿔서) |
| `install.sh`가 오류 | `mkdir -p ~/.agents/skills && cp -r ~/cofa-kit/.agents/skills/* ~/.agents/skills/` 그리고 `cp ~/cofa-kit/AGENTS.md ./AGENTS.kit.md && cp ~/cofa-kit/STEPS.md ./COFA_STEPS.md` |
| `git clone`이 막힘 | 키트 없이 진행. Codex 첫 요청에 "구현 전에 질문 목록, 합의문, 계획을 차례로 만들고 단계마다 멈춰 줘. 결정은 DECISIONS.md에 기록해." |

## 기억할 것
- 담당자에게는 **대상 하나를 짚어서** 묻고, 답에서 새로 나온 말을 이어서 묻습니다.
- 핵심 방식은 **내가 고르고** 이유를 한 문장으로 말합니다.
- 계산과 판정은 코드로, LLM은 말이 필요한 곳에만 씁니다.
- AI가 "됐다"고 하면 증거를 보고, 화면은 직접 눌러 봅니다.
- 작업마다 2분씩 "방금 만든 것"을 내 말로 설명해 봅니다.
