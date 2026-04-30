# STATUS — 사막의 무명신

작업 재개 시 이 파일부터 본다. 현재 어디까지 왔고 다음에 무엇을 할지
정의돼 있다.

**갱신 룰**: 모든 작업 후 이 파일을 갱신. 마지막 갱신 일자·이전 작업·
다음 후보 스텝을 항상 최신으로.

---

## 현재 위치

**Branch**: `autonovel/nameless-god`
**Phase**: foundation (Phase 1 완료, drafting 진입 전)
**Iteration**: 1
**Foundation score**: 7.6 / 임계 7.5 통과
**Lore score**: 9.0 / 임계 7.0 통과
**Decision**: keep

마지막 작업: 2026-04-30 — Phase 1 baseline + spec 정리·인덱스·용어
사전·status 파일 추가.

## 완료된 작업 (요약)

### Brainstorming
시놉시스를 받아 16 가지 설계 결정 합의 완료. 결정 표는 `seed.txt` 참조.
주요 결정:
- 200화+ × 5,000-5,200자 한국 웹소설 형식
- mythic epic 톤 유지 + 웹소설 분량만 차용
- 결말: 모든 신 파멸 + 신 없는 세계
- 주인공 하셈: 1,200년 만의 단일 0 신탁자
- 잊힌 신: 태초의 신, 권능 도용당함, 의식적 동맹자
- POV 3인칭 한정 + 회차 단위 시점 교체
- 12신 시스템 (1 신왕 + 11 신후)
- 운영 단위: Arc 1 정밀, Arc 2-4 거시

### Spec 작성 (Phase 1 baseline)
다음 파일들 작성 완료:
- `seed.txt` — 시놉 + 결정 표
- `world.md` — 세계관 풀 (12신·도용·정치·지리·외부자 5층)
- `characters.md` — 11 인물 wound·want·need·lie + 관계 + 성장 곡선
- `outline.md` — 4 아크 거시 + Arc 1 (1-50회) 회차별 비트 + plant 20건
- `voice.md` Part 2 — 톤·리듬·인물별 voice·시필 5개·anti-시필 9개
- `canon.md` — hard fact 60+ 항목
- `MYSTERY.md` — 중심 미스터리 답 (작가 전용)
- `ANTI-SLOP-KO.md` — 한국 웹소설 슬롭 사전 9 Tier
- `state.json` — iteration·scores·debts

### Spec 정리
- `NOVEL-INDEX.md` — 새 진입점, 모든 파일 인덱스
- `GLOSSARY.md` — 용어·고유명사 사전

---

## 미완 디버트 (state.json.debts)

### D1. voice 한국 웹소설 specificity
- 문제: voice.md Part 2 의 시필 5개가 짧음 (80-150자, 영문 단권 기준).
  한국 웹소설 회당 5,000-5,200자 호흡의 시필 미작성.
- 영향: drafting 진입 시 한 회 분량 안에서의 voice 흐름이 들쭉날쭉할
  위험.
- 해결: drafting 진입 전에 회 1·회 4·회 50 을 한 회 분량으로 미리
  시필 작성.

### D2. ANTI-SLOP-KO 임계 추측치
- 문제: ANTI-SLOP-KO.md 의 회당 빈도 임계가 실증 없이 추측.
- 영향: 너무 엄격하면 멀쩡한 표현 다 슬롭으로 분류, 너무 느슨하면 슬롭
  안 잡힘.
- 해결: 첫 5-10회 작성 후 실제 빈도 측정 → 임계 조정.

### D3. Arc 2-4 보조 인물 placeholder
- 문제: 외방 부족 지도자, 의술 신후, 신왕 측근, 자흐라 그림자의 외형
  등이 미정.
- 영향: Arc 2 spec 작성 시 expand 필요.
- 해결: Arc 1 drafting 끝난 후 Arc 2 spec 작성 단계에서 일괄 정리.

### D4. 도성 내부 동선
- 문제: 12 신전 광장·신왕궁·도서관의 구체적 동선이 outline 회차별 비트
  의 깊이에 비해 부족.
- 영향: 회 1-3 (의식의 날), 회 17-19 (도서관 잠입), 회 26-30 (도서관
  탈출) 작성 시 즉흥 결정 위험.
- 해결: 첫 5회 작성 시 누적되는 캐논 항목으로 자연스럽게 보강. 또는
  drafting 진입 전 작은 지도 sketch.

### D5. 신왕 아셀의 Arc 2 잠복 묘사
- 문제: 아셀이 Arc 1 회 3 에서 잠시 등장 후 Arc 3 까지 부재. 그의 잠복
  동선이 거시 outline 에서만 다뤄짐.
- 영향: Arc 3 등장 시 인물 무게 감각이 약할 위험.
- 해결: Arc 2 spec 작성 시 정밀화 (시점 교체 회차에서 1-2번 잠시
  등장).

### D6. 카드라 가문 구조 (라이샤르 vs 셈한)
- 문제: characters.md 에서 셈한 = 카드라 가문 차남, 라이샤르 = 셈한
  형제로 표기. canon.md 표에 따르면 카드라 가문 = 사막 신 가문.
  그러나 라이샤르는 지식 신 강한 신탁자. 같은 가문 두 형제가 다른
  신을 받음 = 부적절 신탁(C 층) 에 가까움 vs 가문이 셋째에게 지식
  진로를 양육 — 두 해석 가능.
- 영향: Arc 2 회 26-30 (도서관 잠입) 에서 라이샤르 가문 안 에피소드의
  설정에 영향.
- 해결: Arc 2 spec 작성 시 가문 구조 결정. 두 옵션:
  - (1) 카드라 가문 = 사막 신 + 셋째 라이샤르의 지식 신은 부적절 신탁,
       이 자체가 가문의 또 한 층의 부담
  - (2) 라이샤르 가문은 카드라 가문의 분가 또는 지식 신 별개 가문

---

## 다음 가능한 스텝

### 옵션 A. voice calibration (권장)
- 회 1·회 4·회 50 의 voice 시필을 한국 웹소설 회당 분량(5,000-5,200자)
  으로 1편씩 작성
- 작성 후 ANTI-SLOP-KO 룰로 검진 → 실제 빈도 측정 → 임계 조정
- voice.md 의 시필 섹션을 작성된 시필의 강한 단락으로 보강
- D1, D2 디버트 동시 해결
- 소요: 시필 3편 + 평가 + 조정 = 한 세션 전부

### 옵션 B. 추가 spec 정리
- 시간선 통합 (canon.md timeline 보강)
- outline.md 회차 비트 형식 표준화 (POV / 등장 인물 / 사건 / cliffhanger
  네 항목으로 통일)
- 도성 내부 동선 sketch (D4 부분 해결)
- 소요: 짧음, 한 세션의 1/3

### 옵션 C. brainstorming → writing-plans 진입
- 현재 spec 으로 writing-plans skill 호출
- Arc 1 (1-50회) 의 implementation plan 작성
- voice calibration 단계를 plan 의 Step 1 로 박음
- 그 후 본격 drafting 진입
- 소요: plan 작성 + 첫 회차 작성 시작

### 옵션 D. spec 의 일부 항목 변경
- 사용자가 검토 중 바꾸고 싶은 항목 지적 → 수정 → 재평가
- 예: 인물 추가·결말 변경·정치 구조 수정·voice 톤 미세 조정 등

---

## 권장 다음 스텝

**A → C** 순서. voice calibration 으로 D1·D2 해결한 다음 writing-plans
진입. 이렇게 가면 plan 의 Step 1 이 이미 끝난 상태로 진입하니 plan 이
더 가벼워짐.

만약 사용자가 spec 추가 변경을 원하면 D 가 우선.

---

## 새 세션 진입 시 권장 명령 시퀀스

1. 다음 명령으로 작업 재개:
   ```
   git checkout autonovel/nameless-god
   ```
2. 새 Claude Code 세션 시작
3. 자연어로 진입: "사막의 무명신 작업 재개. STATUS.md 확인하고 다음
   스텝 제안해줘."
4. AI 가 `NOVEL-INDEX.md` + `STATUS.md` 읽고 다음 스텝 제안
5. 사용자가 옵션 (A/B/C/D 또는 다른 결정) 선택
6. 작업 진행
7. 작업 종료 시 `STATUS.md` + `state.json` 갱신, git commit

---

## 메타 — 이 작품 spec 의 운영 원칙

1. **Arc 단위 keep/discard**: Arc 한 사이클이 끝나면 평가 → keep 이면
   다음 Arc spec 작성, discard 면 해당 Arc 회차들 reset.
2. **회차 단위 keep/discard**: 한 회 작성 후 평가 → score > 6.0 keep,
   < 6.0 retry (max 5).
3. **외부 API 사용 안 함**: Claude Code 호스트 세션이 모든 LLM 작업
   수행. `gen_*.py`, `evaluate.py` 등 옛 스크립트는 존재하지 않음.
4. **MYSTERY.md 격리**: drafting 시 컨텍스트에 절대 로드 금지. 미스터리
   답이 prose 에 누설되면 안 됨.
5. **5계층 인터록 항상 검사**: 회차 작성 시 voice ↔ outline ↔ canon ↔
   characters ↔ world 모두 일관성 확인.
6. **변경 시 상위 전파**: 챕터에서 새 사실이 등장하면 canon.md 에
   추가. 인물 행동 변화 시 characters.md 의 성장 곡선 갱신. world.md
   까지 전파 필요한 변경은 state.json.debts 에 기록.
