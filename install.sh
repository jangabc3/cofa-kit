#!/usr/bin/env bash
# 사용법: bash ~/cofa-kit/install.sh [작업폴더]
# 스킬은 ~/.agents/skills 에 복사하고, 작업 폴더에 AGENTS.md 가 없을 때만 규칙을 넣는다.
set -euo pipefail

KIT="$(cd "$(dirname "$0")" && pwd)"
WORK="${1:-$PWD}"

mkdir -p "$HOME/.agents/skills"
for d in "$KIT"/.agents/skills/*/; do
  name="$(basename "$d")"
  rm -rf "$HOME/.agents/skills/$name"
  cp -r "$d" "$HOME/.agents/skills/$name"
  echo "스킬 설치: $name"
done

if [ -e "$WORK/AGENTS.md" ]; then
  cp "$KIT/AGENTS.md" "$WORK/AGENTS.kit.md"
  echo "작업 폴더에 AGENTS.md 가 이미 있어 AGENTS.kit.md 로 두었습니다."
  echo "Codex 첫 요청에서 'AGENTS.kit.md 규칙도 따라 줘'라고 말하세요."
else
  cp "$KIT/AGENTS.md" "$WORK/AGENTS.md"
  echo "작업 규칙: $WORK/AGENTS.md"
fi

if [ ! -e "$WORK/COFA_STEPS.md" ]; then
  cp "$KIT/STEPS.md" "$WORK/COFA_STEPS.md"
  echo "작업 순서: $WORK/COFA_STEPS.md (에디터에서 열어 보세요)"
fi

echo "완료. codex 를 (다시) 실행한 뒤 /skills 로 cofa- 스킬이 보이는지 확인하세요."
