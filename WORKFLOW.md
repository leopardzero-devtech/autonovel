# WORKFLOW

Claude Code 환경에서 autonovel 을 운영하는 단계별 가이드.

전체 파이프라인 사양은 [PIPELINE.md](PIPELINE.md), 동작 규칙은
[CLAUDE.md](CLAUDE.md) 참조.

---

## Quick Start

```
1. 이 폴더로 들어와 Claude Code 세션을 연다 (CLAUDE.md 가 자동 로드됨).
2. 소설 작업용 브랜치를 만든다:
     git checkout -b autonovel/<태그>
3. 자연어로 진행한다:
     "한국어 시드로 Phase 1 시작"
```

세션은 `CRAFT.md` / `ANTI-SLOP.md` / `ANTI-PATTERNS.md` /
`PIPELINE.md` / `program.md` 를 룰북으로 따라가며,
모든 LLM 작업을 직접 수행한다. 외부 API 호출 없음.

---

## 단계별 자연어 요청

### Phase 1 — Foundation

```
"시드 10개 생성해줘"            → 후보 시드 제시
"이 시드로 world 빌드"          → world.md 채움
"world 기준으로 characters"      → characters.md 채움
"outline (Part 1: 비트)"        → outline.md 채움
"foreshadowing ledger 추가"     → outline.md Part 2
"voice 발견 (5개 시필 → 1개 선정)" → voice.md Part 2
"MYSTERY 정의"                  → MYSTERY.md (작가 전용)
"canon 크로스체크"               → canon.md
"foundation 평가"                → 점수, 약한 차원, 개선안
```

종료 조건: `foundation_score > 7.5` && `lore_score > 7.0`.

### Phase 2 — First Draft

```
"ch_01 써줘"                     → chapters/ch_01.md
"ch_01 평가"                     → mechanical + LLM judge
"ch_02 써줘"                     → 직전 챕터 마지막 1000자 + outline 항목 사용
...
"슬롭 일괄 검사"                 → 전체 챕터에 ANTI-SLOP 정규식 스캔
```

규칙: `score > 6.0` keep, 아니면 retry (max 5회).
챕터 6 이후엔 anti-pattern 룰을 더 강하게.

### Phase 3a — Auto Revision

```
"전 챕터 적대적 편집"             → OVER-EXPLAIN/REDUNDANT 분류
"OVER-EXPLAIN, REDUNDANT 컷 적용"  → 챕터 패치
"리더 패널"                      → 4 페르소나 병렬, 합의 항목 추출
"합의 항목으로 리비전 브리프"      → briefs/ch_NN.md
"ch_NN 리비전 적용"               → chapters/ch_NN.md 재작성
"전체 평가"                      → novel-level 점수
```

종료 조건: 2 사이클 연속 점수 변화 < 0.5.

### Phase 3b — Deep Review

```
"전 원고 깊은 리뷰"               → 비평가 + 소설 교수 이중 페르소나
"리뷰 항목 파싱"                 → severity, qualified/unqualified
"top 항목 수정"                   → gen_brief 흐름으로 챕터 리비전
```

종료 조건:
- major unqualified 항목 0
- 또는 50% 이상이 qualified
- 또는 항목 ≤ 2

### Phase 4 — Export

```
"outline 재빌드"                 → 챕터에서 outline.md 재생성
"arc summary 재빌드"             → arc_summary.md
"PDF 뽑아줘"                     → typeset/build_tex.py 실행 → tectonic
"ePub 뽑아줘"                    → typeset/epub_* 사용
```

`typeset/build_tex.py` 의 경로 상수는 첫 사용 시 본인 환경에 맞춰
수정해야 한다 (원본은 `/home/jeffq/...` 기준).

---

## 평가·리비전 단축 명령

| 요청 | 의도 |
|---|---|
| `"ch_05 평가"` | mechanical + LLM judge 둘 다 |
| `"ch_05 에서 500단어 잘라"` | OVER-EXPLAIN/REDUNDANT/RHYTHM 분류 후 적용 |
| `"리더 패널 ch_05"` | 단일 챕터 대상 4-페르소나 |
| `"리더 패널"` (인자 없음) | 전 원고 대상 4-페르소나 |
| `"리뷰"` | 풀 원고 비평가+교수 이중 페르소나 |
| `"리비전 브리프 ch_05"` | 패널/평가 결과에서 자동 작성 |
| `"ch_05 리비전 적용"` | 브리프대로 재작성, 평가, keep/discard |

---

## 세 개의 루프

```
INNER LOOP (Claude Code 세션이 자동 수행):
  modify → evaluate → keep/discard → 반복

OUTER LOOP (사용자가 개입):
  결과 검토 → program.md / 룰북 / 템플릿 조정
  → 다시 진행 요청

REVIEW LOOP (자동 리비전 후):
  깊은 리뷰 → 항목 파싱 → 상위 항목 수정 → 반복
  → major unqualified 가 사라지면 종료
```

당신은 소설을 쓰는 사람이 아니다. 소설을 쓰는 시스템을
프로그래밍하는 사람이다.
