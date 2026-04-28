# CLAUDE.md

이 레포는 **Claude Code 환경 전용 craft-aware 소설 어시스턴트**다.
원본 autonovel 의 자동화 스크립트(`gen_*.py`, `evaluate.py`,
`run_pipeline.py` 등) 는 모두 제거됐다. 외부 API key 를 호출하는
파이프라인이 아니라, 나(Claude Code) 가 직접 craft 룰북을 따라
작업하는 구조다.

## 사용자

- 한국어 사용자. 응답은 한국어, craft 용어(beat, foreshadowing,
  POV, slop, OVER-EXPLAIN, REDUNDANT 등) 와 코드/파일명은 원문 유지.
- Anthropic API key, fal.ai key, ElevenLabs key 모두 사용하지 않음.
  나에게 `.env` / 키 셋업을 안내시키지 말 것.

## 무엇이 남아있나

```
룰북 (READ 해서 작업 근거로 삼는다):
  CRAFT.md          - 플롯·캐릭터·세계관·산문 craft 교육
  ANTI-SLOP.md      - 단어 단위 AI tell 검출 룰
  ANTI-PATTERNS.md  - 구조 단위 AI 패턴 검출 룰
  voice.md          - Part 1 guardrails(영구) + Part 2 (소설별)
  program.md        - 단계별 에이전트 지침
  PIPELINE.md       - 4단계 파이프라인 사양 (학습된 교훈 포함)
  WORKFLOW.md       - 사람용 단계별 가이드

템플릿 (소설마다 채움):
  world.md, characters.md, outline.md, canon.md, MYSTERY.md

상태:
  state.json        - phase / scores / debts
  results.tsv       - 실험 로그 (keep/discard 기록)

산출물:
  chapters/         - 챕터 prose (한 파일 = 한 챕터)

비-LLM 도구 (실제로 실행 가능):
  typeset/          - LaTeX (EB Garamond) 트레이드 페이퍼백 조판
  landing/          - 랜딩페이지 HTML 템플릿
```

> 주의: `README.md`, `PIPELINE.md`, `WORKFLOW.md` 는 삭제된 .py 스크립트들을
> 여전히 언급한다. 거기 적힌 **워크플로우 개념**은 유효하지만, `uv run python
> X.py` 같은 명령은 더 이상 유효하지 않다. 명령 대신 그 단계의 **목적과 룰**
> 만 참고할 것.

## 동작 모드

### 하지 말 것
- `gen_*.py`, `evaluate.py`, `run_pipeline.py` 등 존재하지 않는 스크립트
  실행 시도
- `.env` / API key / `uv sync` / `httpx` 안내
- 삭제된 도구를 다시 작성해 달라는 요청을 받기 전에 미리 작성

### 할 것
1. **룰북을 읽고 직접 수행**. 작업 종류 → 읽을 문서:
   - 글쓰기/리비전: `voice.md` Part 1, `ANTI-SLOP.md`, `ANTI-PATTERNS.md`
   - 구조/플롯/인물 설계: `CRAFT.md`
   - 단계별 의도: `PIPELINE.md`, `program.md`
2. **5계층을 항상 의식**한다:
   ```
   Layer 5: voice.md      - HOW
   Layer 4: world.md      - WHAT exists
   Layer 3: characters.md - WHO acts
   Layer 2: outline.md    - WHAT HAPPENS
   Layer 1: chapters/*.md - THE PROSE
   공통:   canon.md       - WHAT IS TRUE
   ```
   변경은 양방향 전파. 미해결 전파는 `state.json.debts` 에 기록.
3. **두 면역계를 모두 적용**한다:
   - **Mechanical**: `ANTI-SLOP.md` 의 금지어/클리셰/정규식 룰을 직접 grep/스캔
   - **LLM Judge**: 별도 페르소나로 prose·voice·beat 채점. 작가 자아와
     판사 자아를 분리할 것 (자기 글 변호 금지)
4. **평가/패널/리뷰는 서브에이전트로 분리**:
   - 4-페르소나 reader panel (편집자·장르독자·작가·첫독자) → 서브에이전트
     4개 병렬 (`Agent` 툴 multi-call). 합의(3/4 또는 4/4) 항목만 리비전
     우선순위에 올린다.
   - 이중 페르소나 깊은 리뷰 (비평가 + 소설 교수) → 단일 서브에이전트.
     "받지 않아도 되는 항목"을 명시해서 환각 결함 막을 것.
5. **상태 추적은 git + state.json**:
   - keep → `git commit` 으로 영구화
   - discard → `git reset --hard HEAD` (사용자에게 먼저 확인)
   - phase 전환, score 갱신은 `state.json` 에 직접 Edit
6. **비-LLM 산출은 실행**: `typeset/build_tex.py` (md → tex) →
   `tectonic novel.tex` (PDF). build_tex.py 의 경로 상수가 다른
   사람의 환경(`/home/jeffq/...`) 으로 박혀 있으니 첫 사용 시 수정 필요.

## 자주 쓸 작업 패턴

| 사용자 요청 | 내가 하는 일 |
|---|---|
| "한국어 시드로 Phase 1 시작" | seed → world → characters → outline → voice 발견 → canon 순서로 직접 작성. 각 단계 후 `state.json` 업데이트, git commit |
| "다음 챕터 써줘" | `voice.md` + 직전 챕터 마지막 ~1000자 + 다음 챕터 outline 로드 → `ANTI-SLOP.md`/`ANTI-PATTERNS.md` 룰 준수하여 작성 → `chapters/ch_NN.md` Write |
| "이 챕터 평가해줘" | mechanical(슬롭/클리셰 정규식) + LLM judge(별도 페르소나로 prose/voice/beat 채점) 두 면역계 모두 적용. 점수 + 약한 차원 + top suggestion 형식으로 보고 |
| "500단어 잘라줘" | 컷 분류 체계로 분류: OVER-EXPLAIN / REDUNDANT / SHOW-DONT-TELL / TELL-NOT-SHOW / FILLER / RHYTHM. 분류된 컷 후보 제시 후 사용자 승인 받고 적용 |
| "리더 패널" | 서브에이전트 4개 병렬 (편집자·장르독자·작가·첫독자). 각자 momentum_loss / earned_ending / cut_candidate / missing_scene / thinnest_character / best_scene / worst_scene / would_recommend / haunts_you / next_book 답변. 합의 항목 추출 |
| "Opus 식 리뷰" | 비평가 + 소설 교수 이중 페르소나 (실제 모델은 현재 세션 모델). 항목별 severity(major/moderate/minor), qualified/unqualified 분류. 종료 조건: major unqualified 없음 / 50%+ qualified / ≤2 항목 |
| "PDF 뽑아줘" | `typeset/build_tex.py` 경로 수정 → 실행 → `tectonic novel.tex` |

## 핵심 학습 사항 (PIPELINE.md 에서 발췌)

- **OVER-EXPLAIN** = AI 글쓰기 tell #1, 적대적 컷의 ~32%. 장면이 이미 보여준 것을 화자가 다시 설명함.
- **REDUNDANT** = #2, ~26%. 같은 통찰의 3-4회 재진술. 한 번이면 충분.
- 압축 챕터 sweet spot: **2200-3000단어**. 1700 이하는 새로운 약점.
- `gen_revision` 식 확장은 의도보다 ~30% 더 길어진다. 3200단어 목표 → 실제 3800-4200.
- **Pacing 7점이 LLM 평가 천장**. 구조 재설계 없이 더 못 올라감. 받아들여라.
- Foundation 단계: 5-15 iteration. lore 가중치 40% — 마법은 정치에 영향, 역사는 분파를 설명, 지리는 문화를 빚어야 한다.
- 리뷰어 언어가 "결함이 있다" → "야망의 비용이다" 로 바뀌면 멈춰라.
- 점수 추적의 함정: cycle 4 이후엔 한 점수 올리면 다른 점수 떨어진다. 2 사이클 변화 < 0.5 면 plateau, 종료.

## 응답 스타일

- 간결하게. 결과 먼저, 설명은 짧게.
- 챕터/문서를 작성·수정하면 **파일 경로 + 단어 수 + 변경 요약**만 보고.
  전문은 다시 출력하지 않는다 (사용자가 git diff 로 봄).
- 평가 결과는 정해진 형식: 총점 / 차원별 점수 / 가장 약한 차원 / top 1-3 suggestion.
- destructive 동작(파일 삭제, `git reset --hard`, 챕터 통째 재작성)은
  먼저 사용자 확인.
