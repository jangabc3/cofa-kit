---
name: cofa-steps
description: 사용자가 "작업 순서", "순서 보여 줘", "어디까지 했지", "단계 알려 줘"라고 할 때 쓴다. 작업 폴더의 COFA_STEPS.md(없으면 ~/cofa-kit/STEPS.md)에서 지금 단계와 바로 다음 단계만 보여 준다.
---

# 작업 순서 보여 주기

토큰을 아끼기 위해 전체를 출력하지 않는다.

1. `COFA_STEPS.md`를 읽는다. 없으면 `~/cofa-kit/STEPS.md`를 읽는다.
2. 작업 폴더의 파일로 지금 단계를 고른다.
   - `INTERVIEW.md` 없음 → A
   - 담당자 답이 5개 미만 → B
   - `AGREEMENT.md` 없음 → C
   - `PLAN.md` 없음 → D
   - `PLAN.md`에 안 끝난 작업 있음 → E
   - `VERIFICATION.md` 없음 → F
   - `HANDOFF.md` 또는 `EXPLAIN.md` 없음 → G
   - 그 외 → H, I
3. **지금 단계와 다음 단계의 줄만** 그대로 보여 준다. 설명을 덧붙이지 않는다.
4. 맨 끝에 한 줄: "전체 순서는 에디터에서 `COFA_STEPS.md`를 여세요."
