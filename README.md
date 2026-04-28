# autonovel (Claude Code edition)

Claude Code 안에서 돌리는 craft-aware 소설 창작 시스템.
시드 컨셉 한 줄에서 시작해, 5계층 + 두 면역계 워크플로우를 따라
한 권 분량의 소설을 작성·리비전·조판한다.

원본은 자체 Anthropic API 로 호출하던 자동화 파이프라인이었다.
이 fork 는 LLM 호출 부분을 Claude Code 호스트 세션 자체로 대체했고,
대신 **craft 룰북과 템플릿** 만 남겨 두었다.

원형: [karpathy/autoresearch](https://github.com/karpathy/autoresearch)
의 modify → evaluate → keep/discard 루프를 픽션에 이식.

**원본의 첫 산출물:** *The Second Son of the House of Bells* —
19챕터, 79,456단어. `autonovel/bells` 브랜치 참조.

---

## Quick Start

이 레포는 **명령어가 없다**. Claude Code 세션 안에서 자연어로
요청하면 된다. 세션이 열리면 `CLAUDE.md` 가 자동 로드되어
craft 룰북을 알고 있는 상태가 된다.

```
1. cd autonovel
2. claude   (또는 IDE 의 Claude Code 진입)
3. 자연어 요청:
   - "한국어 시드로 Phase 1 시작"
   - "다음 챕터 써줘"
   - "ch_05 평가해줘"
   - "리더 패널 돌려줘"
   - "PDF 뽑아줘"
```

세션이 `CRAFT.md` / `ANTI-SLOP.md` / `ANTI-PATTERNS.md` /
`PIPELINE.md` 를 룰북으로 읽고 직접 작업을 수행한다.

---

## 파이프라인 (개념)

상세 사양은 [PIPELINE.md](PIPELINE.md) 참조.

### Phase 1: Foundation
시드에서 세계·인물·아웃라인·보이스·캐논을 빌드.
`foundation_score > 7.5` 까지 반복.

### Phase 2: First Draft
챕터를 순서대로 작성, 각각 평가. `score > 6.0` 이면 keep,
아니면 재시도. 완벽보다 전진.

### Phase 3a: Auto Revision
적대적 편집 → 컷 적용 → 리더 패널 → 리비전 브리프 → 챕터 재작성.
점수 정체(plateau) 시 종료.

### Phase 3b: Deep Review Loop
풀 원고를 비평가 + 소설 교수 이중 페르소나로 리뷰.
실행 가능한 항목 추출 → 상위 항목 수정 → 반복.
major unqualified 항목이 사라지면 종료.

### Phase 4: Export
문서 재빌드, LaTeX 조판, ePub, 랜딩페이지.

---

## 5계층 + 두 면역계

소설은 다섯 층이 함께 진화하는 시스템이다:

```
Layer 5: voice.md       - HOW 우리는 쓰는가
Layer 4: world.md       - WHAT 이 존재하는가
Layer 3: characters.md  - WHO 가 행동하는가
Layer 2: outline.md     - WHAT HAPPENS
Layer 1: chapters/*.md  - 실제 산문
공통:    canon.md       - WHAT IS TRUE
```

변경은 양방향 전파한다 (lore 수정 → outline → 챕터 리비전, 또는
글쓰기 중 발견된 빈틈 → lore 갱신 → 하류 검증). 미해결 전파는
`state.json.debts` 에 기록.

### 두 면역계

1. **Mechanical** (`ANTI-SLOP.md`, `ANTI-PATTERNS.md`):
   금지어, 픽션 클리셰, show-don't-tell 위반, 문장 균질화 패턴.
2. **LLM Judge**: 별도 페르소나로 prose 품질, voice 일관성,
   캐릭터 변별, beat 커버리지를 채점한다.

### 깊은 리뷰 루프

자동 리비전 사이클 후, 풀 원고를 다음 프롬프트로 검토한다:

> "이 소설을 읽어라. 먼저 문예 비평가로서, 그 다음 소설학 교수로서
> 리뷰하라. 결함이 있다면 구체적이고 실행 가능한 제안을 하라.
> 공정하되 정직하라. 결함을 *반드시* 찾을 필요는 없다."

이중 페르소나 리뷰는 자동 도구가 못 잡는 것을 잡는다: 산문 단위
반복, 캐릭터 얇음, 윤리적 빈틈, 구조적 단조로움. 리뷰어 항목이
대부분 자격 표현(qualified hedge) 으로 바뀔 때까지 반복한다.

---

## 파일 구조

```
룰북 (master 에 영구 보존):
  README.md              - 프로젝트 개요 (이 파일)
  CLAUDE.md              - Claude Code 동작 가이드
  PIPELINE.md            - 4단계 파이프라인 사양 + 학습된 교훈
  WORKFLOW.md            - 단계별 사용 가이드
  program.md             - 단계별 에이전트 지침
  CRAFT.md               - 플롯·캐릭터·세계관·산문 craft 교육
  ANTI-SLOP.md           - 단어 단위 AI tell 검출 룰
  ANTI-PATTERNS.md       - 구조 단위 AI 패턴 검출 룰
  voice.md               - Part 1 guardrails (영구), Part 2 (소설별)

템플릿 (소설별 브랜치에서 채움):
  world.md, characters.md, outline.md, canon.md, MYSTERY.md
  state.json             - 파이프라인 상태 추적
  results.tsv            - 실험 로그 (keep/discard)
  chapters/              - 챕터 prose

조판:
  typeset/novel.tex      - LaTeX 템플릿 (EB Garamond, 트레이드 페이퍼백)
  typeset/build_tex.py   - md → tex (Python stdlib 만 사용)
  typeset/epub_*         - ePub 메타데이터·CSS·앞부속

랜딩:
  landing/index.html     - 반응형 랜딩페이지 템플릿
```

---

## 외부 API

이 fork 는 외부 API key 를 사용하지 않는다. Claude Code 세션이 곧
LLM 이다. 만약 표지 아트(Nano Banana 2 / fal.ai) 나 오디오북
(ElevenLabs) 이 필요하다면 별도 도구를 직접 도입해야 한다 (이전
스크립트들은 제거됨).

---

## 영감

- [karpathy/autoresearch](https://github.com/karpathy/autoresearch) — 자율 연구 루프
- Brandon Sanderson 의 글쓰기 강의 (Laws of Magic, character sliders)
- K.M. Weiland, *Creating Character Arcs*
- Blake Snyder, *Save the Cat*
- Ursula K. Le Guin, "From Elfland to Poughkeepsie"
- [slop-forensics](https://github.com/sam-paech/slop-forensics), [EQ-Bench Slop Score](https://eqbench.com/slop-score.html)
