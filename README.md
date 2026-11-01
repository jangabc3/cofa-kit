# cofa-kit

현업 담당자의 짧은 요청을 받아 AI 코딩 에이전트(Codex)로 시제품을 만드는 과제용 작업 키트입니다.
정답 코드나 템플릿은 없습니다. 묻고, 합의하고, 계획하고, 검증하고, 기록하는 **과정**만 돕습니다.

## 설치 (작업 폴더에서)
```bash
git clone https://github.com/jangabc3/cofa-kit ~/cofa-kit
bash ~/cofa-kit/install.sh .
```
- 스킬 7개가 `~/.agents/skills/`에 들어갑니다.
- 작업 폴더에 `AGENTS.md`가 없으면 규칙을 넣고, 있으면 `AGENTS.kit.md`로 둡니다.
- 그다음 `codex`를 실행하고 `/skills`로 `cofa-` 스킬이 보이는지 확인합니다.

## 작업 순서가 헷갈리면
설치하면 작업 폴더에 `COFA_STEPS.md`가 생깁니다. 에디터에서 열어 보세요(토큰 0). Codex에게 `$cofa-steps`라고 하면 지금 단계와 다음 단계만 보여 줍니다.

## 처음부터 끝까지 진행표
담당자와 Codex에 보낼 말을 단계별로 정리한 [RUNBOOK.md](RUNBOOK.md)를 보세요. 시험 중에는 에디터에서 `~/cofa-kit/RUNBOOK.md`를 열면 됩니다.

## 하나만 기억하기
헷갈리면 언제든 `$cofa-next` 또는 그냥 "다음 뭐 해?"라고 입력하세요.
지금 단계, 남은 시간, 다음에 입력할 말을 알려 줍니다. Codex는 모든 답의 끝에도 `👉 다음:`을 붙입니다.

## 스킬
| 스킬 | 언제 | 남기는 파일 |
|---|---|---|
| `$cofa-next` | 헷갈릴 때 언제나 | `.cofa/START` (시작 시각) |
| `$cofa-interview` | 시작 직후, 담당자 답을 받을 때마다 | `INTERVIEW.md` |
| `$cofa-agreement` | 구현 전 | `AGREEMENT.md` |
| `$cofa-plan` | 합의 뒤, 코드 전 | `PLAN.md` |
| `$cofa-decisions` | 무언가를 정할 때마다 | `DECISIONS.md` |
| `$cofa-verify` | 끝났다고 말하기 전 | `VERIFICATION.md` |
| `$cofa-handoff` | 제출 직전, 세션 교체 때 | `HANDOFF.md`, `.handoff/SESSION.md` |
| `$cofa-explain` | 마무리 전 | `EXPLAIN.md` (내 작업 설명 노트) |

## 180분 흐름과 입력할 말

| 구간 | 할 일 | Codex에게 |
|---|---|---|
| 0–10분 | README 정독, 키트 설치, `/status` `/model` 확인 | `$cofa-interview README와 자료를 훑고 질문 후보를 뽑아 줘. 아직 아무것도 만들지 마.` |
| 10–35분 | 담당자에게 한 번에 하나씩 질문 → 답을 붙여 넣기 | `$cofa-interview 담당자 답 기록해 줘: (답)` |
| 35–40분 | 합의문 → 확인 메시지를 담당자에게 보내기 | `$cofa-agreement` |
| 40–50분 | 계획 검토, 빠진 조건 지적 | `$cofa-plan 남은 시간은 ○○분이야.` |
| 50–140분 | 핵심 기능 하나 끝까지 → 확장. 단계마다 커밋 | `PLAN.md 작업 1번만 해 줘. 끝나면 확인 방법대로 확인하고 커밋해.` |
| 140–160분 | 검증, 미리보기에서 직접 눌러 보기 | `$cofa-verify` |
| 160–170분 | 문서 정리, 작업 설명 정리 | `$cofa-handoff` 다음 `$cofa-explain` |
| 170분 | **제출 시작** | |

## 안 될 때
| 증상 | 이렇게 |
|---|---|
| `/skills`에 `cofa-`가 안 보임 | Codex를 껐다 켠다. 그래도 없으면: `~/cofa-kit/.agents/skills/cofa-interview/SKILL.md 읽고 그대로 따라 해 줘` (스킬 이름만 바꿔서) |
| `install.sh`가 오류 | `mkdir -p ~/.agents/skills && cp -r ~/cofa-kit/.agents/skills/* ~/.agents/skills/` 그리고 `cp ~/cofa-kit/AGENTS.md ./AGENTS.kit.md` |
| `git clone`이 막힘 | 키트 없이 진행. Codex 첫 요청에 "구현 전에 질문 목록, 합의문, 계획을 차례로 만들고 단계마다 멈춰 줘. 결정은 DECISIONS.md에 기록해." |

## 기억할 것
- 담당자에게는 **대상 하나를 짚어서** 묻습니다. 초반에는 "AI", "자동화" 같은 해법 단어를 쓰지 않습니다.
- 계산과 판정은 코드로, LLM은 말이 필요한 곳에만 씁니다.
- AI가 "됐다"고 하면 증거를 보고, 화면은 직접 눌러 봅니다.
- 결정은 내 말로 설명할 수 있어야 합니다. 서술형 답은 **무엇을 → 왜 → 약점 → 다음** 순서로 씁니다.
- 대화가 길어지면 `$cofa-handoff`로 세션을 넘깁니다.
