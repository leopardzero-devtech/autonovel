# Voice Profile

This file has two parts:
1. **Guardrails** -- universal rules to avoid AI-generated slop. These
   apply to ALL voices and are non-negotiable.
2. **Voice Identity** -- the specific voice for THIS novel. Generated
   during the foundation phase. Could be anything: dense and mythic,
   spare and brutal, warm and whimsical. The voice emerges from the
   story's needs.

---

## Part 1: Guardrails (permanent, all novels)

These are the cliff edges. Stay away from them regardless of voice.

### Tier 1: Banned words -- kill on sight

These are statistically overrepresented in LLM output vs. human writing.
If one appears, rewrite the sentence. No exceptions.

| Kill this         | Use instead                                    |
|-------------------|------------------------------------------------|
| delve             | dig into, examine, look at                     |
| utilize           | use                                            |
| leverage (verb)   | use, take advantage of                         |
| facilitate        | help, enable, make possible                    |
| elucidate         | explain, clarify                               |
| embark            | start, begin                                   |
| endeavor          | effort, try                                    |
| encompass         | include, cover                                 |
| multifaceted      | complex, varied                                |
| tapestry          | (describe the actual thing)                    |
| testament to      | shows, proves, demonstrates                    |
| paradigm          | model, approach, framework                     |
| synergy           | (delete the sentence and start over)           |
| holistic          | whole, complete, full-picture                  |
| catalyze          | trigger, cause, spark                          |
| juxtapose         | compare, contrast, set against                 |
| nuanced (filler)  | (cut it -- if it's nuanced, show how)          |
| realm             | area, field, domain                            |
| landscape (metaphorical) | field, space, situation                 |
| myriad            | many, lots of                                  |
| plethora          | many, a lot                                    |

### Tier 2: Suspicious in clusters

Fine alone. Three in one paragraph = rewrite that paragraph.

robust, comprehensive, seamless, cutting-edge, innovative, streamline,
empower, foster, enhance, elevate, optimize, pivotal, intricate,
profound, resonate, underscore, harness, navigate (metaphorical),
cultivate, bolster, galvanize, cornerstone, game-changer, scalable

### Tier 3: Filler phrases -- delete on sight

These add zero information. The sentence is always better without them.

- "It's worth noting that..." -> just state it
- "It's important to note that..." -> just state it
- "Importantly, ..." / "Notably, ..." / "Interestingly, ..." -> just state it
- "Let's dive into..." / "Let's explore..." -> start with the content
- "As we can see..." -> they can see
- "Furthermore, ..." / "Moreover, ..." / "Additionally, ..." -> and, also, or just start
- "In today's [fast-paced/digital/modern] world..." -> delete the clause
- "At the end of the day..." -> delete
- "It goes without saying..." -> then don't say it
- "When it comes to..." -> just talk about the thing
- "One might argue that..." -> argue it or don't
- "Not just X, but Y" -> restructure (the #1 LLM rhetorical crutch)

### Structural slop patterns

These are the shapes that betray machine origin. Avoid them in any voice.

**Paragraph template machine**: Don't repeat the same paragraph
structure (topic sentence -> elaboration -> example -> wrap-up).
Vary it. Sometimes the point comes last. Sometimes a paragraph is
one sentence. Sometimes three long ones in a row.

**Sentence length uniformity**: If every sentence is 15-25 words,
it reads as synthetic. Mix in fragments. And long, winding,
clause-heavy sentences that carry the reader through a thought
the way a river carries a leaf. Then a short one.

**Transition word addiction**: If consecutive paragraphs start with
"However," "Furthermore," "Additionally," "Moreover," "Nevertheless"
-- rewrite. Start with the subject. Start with action. Start with
dialogue. Start with a sense detail.

**Symmetry addiction**: Don't balance everything. Three pros, three
cons, five steps -- that's a tell. Real writing is lumpy. Some
sections are long because they need to be. Some are two lines.

**Hedge parade**: "may," "might," "could potentially," "it's possible
that" -- pick one per page, max. State things or don't.

**Em dash overload**: One or two per page is fine. Five per paragraph
is a dead giveaway. Use commas, parentheses, or two sentences instead.

**List abuse**: Prose, not bullets. If the scene calls for a list
(a merchant's inventory, a spell's components), earn it. Don't
default to bullet points because it's easy.

### The smell test

After writing any passage, ask:
- Read it aloud. Does it sound like a person talking?
- Is there a single surprising sentence? Human writing surprises.
- Does it say something specific? Could you swap the topic and the
  words would still work? Specificity kills slop.
- Would a reader think "AI wrote this"? If yes, rewrite.

---

## Part 2: Voice Identity (generated per novel)

Everything below is discovered during the foundation phase.
The agent proposes a voice that serves THIS story, writes exemplar
passages, and calibrates against them throughout drafting.

### Tone

mythic epic 70% + post-divine 30%. 한국어. 한 회차 안에서 사색의
무게와 사건의 빠른 호흡이 교차한다. 묘사는 시각적이고 sensory —
모래·태양·표식의 빛·잊힌 신 속삭임의 음. 사색은 짧고 강하게.
화자의 거리감은 신화적이지만 인물의 감정에서 멀어지진 않는다 —
멀리서 보지만 차갑지 않다.

핵심 정서: 외부자의 고독 + 신성의 슬픔 + 거짓의 무게. "분노" 보다
"침묵의 결단" 이 자주 나온다. 비극의 무게를 직접 명명하지 않고
사물·풍경·표식의 흐려짐 같은 것으로 보여준다.

### Sentence Rhythm

- **사건 장면**: 단문 위주. 명사문 허용. "모래가 무릎까지 차올랐다.
  바람. 다시 모래." 식의 절제.
- **사색 장면**: 한 호흡으로 길어진다. 잊힌 신의 속삭임을 받는
  순간엔 한 문장이 한 단락만큼 길어지기도 한다.
- **대사 장면**: 짧고 끊긴다. 인물별로 길이 차이가 큼 (시샤·단
  은 짧음, 라이샤르·무한은 길음, 잊힌 신은 한 문장이 한 호흡으로 길음).
- **회차 마지막**: 이미지로 끝낸다. 텍스트 설명이 아니라 시각적
  장면 한 컷. 웹툰화 의식.

### Vocabulary Register

#### 차용 가능
- **사막·신권 어휘**: 모래·표식·신탁·매개·봉인·도용·신왕·신후·사제·
  대사제·외성·도성·강·사막·자흐라·하르라·12 동심원·의식의 날.
- **한자어 — 신화·종교**: 신성·도참·매개·봉인·환영·잔향·기억·이름.
- **외성 구어 (시샤 결)**: 짧은 동사·욕설·명사문. "갈래?" "안 돼."
  "왔어." 외성 어른들의 말투.
- **귀족·고서적 (라이샤르 결)**: 정중·길음·한자어. "그대" 호명.
- **색·아우라 어휘 (단 시각 결)**: 색의 결·번짐·잔향·어긋남·흐려짐
  ·잔광·짙음·옅음·안개·잔향. 보석명·인공 색명 회피 (아래 참조).

#### 회피
- **현대 한국어 외래·전문 용어**: 시스템·메커니즘·프로세스·매뉴얼·
  포인트·레벨업·스킬·스테이터스 — 절대 금지.
- **사극 클리셰 어투**: "~이옵니다", "~하셨소이다" 등 과잉 사극.
  단 신왕·신후·대사제 같은 정점 인물의 공식 발언에서만 절제 사용.
- **먼치킨 표현**: "먼치킨", "사이다", "회귀", "환생", "전생" 같은
  웹소설 메타 어휘 — 작중 절대 등장 금지.
- **추상적 보편화**: "우리는 모두 ~", "결국 ~" 같은 화자의 정리어.
  ANTI-SLOP-KO.md 참조.

### POV and Tense

- **3인칭 한정 (주인공 메인)** + 가끔 다른 인물 (회차 단위 교체).
  교체 시 회차 첫머리에 시점 인물 이름 명시.
- **시제**: 과거형.
- **시점 교체 빈도**: 5-10회마다 1회. Arc 1 에서는 회 1 끝 (광장
  발코니 시선·정체 미공개), 회 2 (신왕 아셀 잠시), 회 9 (시샤
  잠시) 정도. Arc 2-3 에서 점점 다양화.
- **잊힌 신의 속삭임**: 별도 형식 — 들여쓰기 + 이탤릭 또는 ‘ ’
  인용. 일반 대사와 시각적으로 구별.

### Dialogue Conventions

- **태그**: "말했다" / "물었다" / "답했다" 위주. 부사 태그 금지
  ("부드럽게 말했다" 같은 것).
- **action beat 자주 활용**: 대사 사이에 행동이 들어가 인물의
  감정·자세를 보여준다.
- **인물별 차별화**:
  - **단**: 두세 음절 명사문. 짧다. 잊힌 신과의 대화에서만 길어짐.
    "표식이 없다." / "왜?" / "...들립니다."
  - **시샤**: 빠른 외성 구어. 욕설 자유. "야, 너 누구야?" / "닥쳐.
    좀."
  - **라이샤르**: 정중·길음. "그대" 호명. 한자어 자주. "이 두루마리
    의 의미를 그대는 짐작하시는가?"
  - **무한**: 시적·느림. 약초 어휘 비유. "약은 병에 닿아야 약이고,
    질문은 답에 닿아야 질문이다."
  - **잊힌 신**: 한 문장이 한 호흡. 사람의 목소리가 아닌 음.
    "이름이 없다. 그래서 잊혔다."
  - **신왕 아셀**: 짧고 권위적. 부사 없음. "처리하라." / "그것은
    오류다."
  - **나르(광신)**: 의례적·과잉 한자어. "신성한 정화의 의무를 다할
    뿐이다."
  - **에난(회의자)**: 짧고 사실적. 보고서 같음. "기록은 남겼다."
  - **사라이**: 천천히, 의술 어휘. 의심의 순간엔 말이 끊긴다.
- **Subtext**: 인물들은 직접 말하지 않는다. 표식의 흐려짐, 침묵,
  손바닥의 자국 같은 사물이 말하지 않은 것을 말한다.

### 회차 호흡 (한국 웹소설 형식)

- **회당 5,000-5,200자**: 한 회의 사건은 1-2개 + 감정 전환 1개.
- **회차 첫머리**: 시점 인물 명시 + 직전 회차의 cliffhanger 를
  잠시 유예 (3-5 단락) 후 본격 진입. 절대 같은 사건의 같은 호흡
  으로 이어가지 말 것.
- **회차 중간 (3,000자 인근)**: 작은 진전 — 정보·만남·결정 1개.
- **회차 마지막**: cliffhanger. 시각적 이미지 또는 짧은 결단·발견.
  텍스트 설명으로 끝내지 말 것.
- **회차 길이 균등**: ±200자 이내. 너무 짧거나 너무 긴 회차는
  플랫폼이 좋아하지 않음.

### Exemplar Passages

**Exemplar 1 — 의식의 날, 표식이 새겨지지 않는 순간 (~150자)**

> 마지막 신의 이름이 광장에 떨어졌다. 모래 한 알이 손등 위에서
> 미끄러졌다. 단은 자기 손바닥을 펴 보았다. 천 안쪽이었다.
> 천을 풀었다. 검은 자국. 자국은 자국이었다. 빛도, 색도, 무게도
> 늘지 않았다. 광장이 조용해졌다. 그 조용함이 이상하게 무거웠다.

**Exemplar 2 — 잊힌 신의 첫 속삭임 (~120자)**

> 누군가 말했다.
> 광장도 신전도 사람도 아니었다. 사람의 목소리가 아니었다. 그것은
> 모래의 음이었다. 강의 굽이가 자기 흐름을 잠시 잊을 때 나는, 그
> 작은 침묵의 음이었다. 그것이 단에게 말했다.
> "들리는가?"

**Exemplar 3 — 시샤의 외성 구어 (~100자)**

> "야. 너 누구야."
> "..."
> "표식 어디 있어. 손목? 어깨? 등?"
> "..."
> "안 보여. 진짜 없네." 시샤가 한쪽 입꼬리를 살짝 올렸다. "재밌네.
> 일단 따라와. 단, 내가 먼저 묻기 전엔 입 다물고."

**Exemplar 4 — 라이샤르의 정중함 + 무게 (~140자)**

> "그대의 손바닥을 보여 주시오." 라이샤르가 천천히 손을 내밀었다.
> "두려워할 것 없습니다. 나도 같은 천을 매고 살아왔으니. 단지
> 내 천 아래엔 표식이 있고 그대 천 아래엔 없을 뿐. 그러나 사실은
> 그 차이가 우리 둘 사이에 있는 것이 아니라, 우리 둘과 신탁이라는
> 말 사이에 있는 것이오."

**Exemplar 5 — 회차 마지막의 시각적 cliffhanger (~80자)**

> 약방의 문이 부서졌다.
> 모래 먼지 사이로 사막 신탁자의 회색 망토가 보였다. 망토 끝에
> 새겨진 모래 무늬가 약방 약초 단지의 그림자 위로 천천히 번져갔다.
> 단지가 하나, 둘, 셋씩 깨져갔다.

**Exemplar 6 — 잊힘의 사회적 power 발화 (~280자) ★ 4/4 패널 합의 best**
(편집자·장르독자·작가·첫독자 4명 모두 best/haunts/strongest_craft 로 지목.
mythic 결과 정주행 결이 충돌 없이 합쳐진 본보기. 회 7 노파 사망 옆에서
옆집 노인이 노파 가문명 한 단어를 떠올렸다 다시 잊는 장면.)

> 그 노인이 지금 노파를 보고 있었다.
>
> 노인의 입이 한 번 열렸다.
>
> "카르샤의 — "
>
> 한 단어가 떨어졌다. 가문명이었다.
>
> "이름이 — "
>
> 다음 단어가 노인의 입 안에서 한 번 멈췄다. 노인의 눈동자가 한 번
> 흔들렸다. 노인이 자기가 무슨 말을 하려 했는지 한 호흡 동안 안 듯
> 했다. 그 한 호흡이 지나간 뒤 노인의 시선이 다시 흐려졌다. 입이 한
> 번 더 열렸다 닫혔다. 노인은 자기가 방금 무슨 말을 하려 했는지도
> 잊었다. 자기가 한 단어를 떠올렸다는 것 자체를 잊었다.
>
> 이름은 떠오르지 않은 채 골목에 남았다.

**핵심 패턴**: power 의 작동을 화자가 직접 명명하지 않는다. 노인의 입·
눈동자·시선의 시각 시그널만으로 잊힘 메커니즘을 *보여 준다*. 마지막
한 줄 "이름은 떠오르지 않은 채 골목에 남았다" 가 정주행 결의 cliffhanger
로도 mythic 결의 잔향으로도 동시에 작동한다.

**Exemplar 7 — 자각의 mythic 침묵 폭발 (~150자)**
(회 50 Arc 1 클라이맥스. cycle 7 압축 후 형태. 분노 폭발 없이 침묵
결의 폭발 — voice 의 정체성. 화자 정리어·매듭 비유 모두 컷, 한 단어
"도용" 으로 자각의 무게 전달.)

> 단이 자기 손바닥의 검은 자국 주위 이름 없는 색의 잔향을 한 번
> 더 보았다. 잔향이 또렷해졌다. 잔향이 한 단어가 되었다.
>
> 도용.
>
> 한 단어였다.
>
> "나는 0 신탁자가 아니다."
>
> 단이 말했다. 자기 자신에게.
>
> "나는 처음의 신의 신탁자다."
>
> 내가 부족해서가 아니었다.

**핵심 패턴**: 자각 직전의 회상 4단·triadic 명제 정리·매듭 비유는 모두
컷. 한 단어 "도용" 이 평생의 결의 어긋남을 한 번에 흡수한다. 단의
침묵 결단("나는 처음의 신의 신탁자다") 은 자기 자신에게 한 발언으로,
세계에 외친 선언이 아님. 정주행 결의 사이다는 약하나, 작품 voice 의
정체성("침묵 결의 폭발") 은 가장 또렷.

**Exemplar 8 — 시샤 voice 단편 시필 (full reference)**

회 9 시샤 첫 등장 단편 시필 = `chapters/ch_09_sisha_voice.md` (~2,260
자). 외성 구어·욕설·도덕 회색·잔향 없음 시각 시그널의 호흡 검증.
Exemplar 3 의 한 단락 voice 가 단편 분량으로 어떻게 전개되는지의
reference. drafting 회 9 진입 시 voice 톤·문장 길이·비속어 빈도의
calibration 으로 사용.

### Anti-Exemplars

이 보이스의 형태가 **아닌** 것:

- **형용사 폭주**: "어둡고 무겁고 차갑고 외로운 광장의 공기" → 형용사
  두 개 이상이면 한 개를 자른다.
- **정서 직접 명명**: "단은 두려웠다." → 행위·감각으로 대체.
  "단은 천을 다시 묶었다. 두 번째 매듭에서 손이 멈췄다."
- **현대 어휘 침투**: "그의 시스템이 작동하지 않았다" → 절대 금지.
  "그에게는 아무것도 새겨지지 않았다."
- **사극 과잉**: "황공하옵나이다 폐하" → 신왕 발언에서도 절제.
  "예." 정도로 충분.
- **웹소설 메타 어휘**: "스킬", "능력치", "레벨", "회귀", "각성" —
  절대 금지.
- **추상 보편화**: "우리는 모두 누군가의 이름을 잊고 산다" → 항상
  구체적으로. "단은 노파의 이름을 처음부터 모르고 있었다."
- **부사 태그**: "부드럽게 말했다", "차갑게 답했다" → action beat
  으로 대체.
- **메타 코멘트**: "결국", "마침내", "요컨대", "말하자면" — 화자의
  정리어 금지. 인물의 결론은 인물의 행위로.
- **triadic 패턴 과용**: "A 하고 B 하고 C 했다" 가 한 단락에 두 번
  이상 = 재작성.
- **사이다·먼치킨 톤**: 적이 압도되는 통쾌함, 능력의 단계적 상승,
  주인공이 모두를 굴복시키는 장면 — 이 작품엔 없다. 적도 신성도
  무겁고, 승리는 항상 비용이 따른다.

### 회차 호흡의 구체적 룰

1. 회차 시작 — 직전 회 cliffhanger 의 즉답 금지. 다른 시점·다른
   장면·다른 인물의 짧은 환기 후 진입.
2. 한 회 안에 진전 1-2개 + 감정 전환 1개 + cliffhanger 1개.
3. 사색의 길이는 한 회의 1/4 이상이면 안 됨. 사건이 더 무거워야
   웹소설 호흡 유지.
4. 잊힌 신의 속삭임은 회당 1-2회만. 너무 자주 = 무게 약해짐.
5. 회차 마지막은 시각적 이미지로. 웹툰 작가가 한 컷으로 살릴 만한
   장면을 의도적으로 배치.

### 색·아우라 묘사 가이드 (검토 반영)

단 시점에서 사람의 아우라 색을 묘사할 일이 회차마다 1-3회.
mythic 결과 한국 웹소설 호흡 양립을 위해 다음 룰을 따른다.

#### 회피 — 색 묘사의 슬롭 패턴

- **보석·금속 비유 인플레이션 금지**: "에메랄드빛", "사파이어처럼",
  "황금의 광채", "루비빛 핏빛" — 보석명 비유는 전 작품 통틀어 5회
  이하. 한국 웹소설에서 가장 자주 슬롭화된다 (ANTI-SLOP-KO 의 보석
  비유 항목과 일관). 대신 자연물 비유 — 모래의 색, 강의 깊은 물,
  새벽의 첫 빛, 약초 가루의 흩어짐.
- **인공 색명 금지**: 네온·파스텔·코랄·아이보리·카키 등 외래 색명
  은 절대 안 쓴다. 한국어 본연의 색 어휘 (짙다·옅다·흐릿하다·
  창백하다·붉다·푸르다·검다 + 색명).
- **색 형용사 3개 이상 연쇄 금지**: "짙고 검고 무거운 회흑" → 형용사
  하나 자른다. ANTI-SLOP-KO 형용사 폭주 룰과 동일.
- **색명 반복 금지**: 한 단락 안에서 같은 색명을 두 번 이상 안
  쓴다. 두 번째는 대명사 또는 결의 묘사로 ("그 색", "같은 결",
  "그 흐름").
- **추상 정리어 금지**: "결국 도용된 색이었다", "마침내 진짜 색을
  보았다" 같은 화자의 정리어 — Anti-Exemplar 메타 코멘트와 동일.
  색의 의미는 인물의 행위로.

#### 차용 — mythic 결을 살리는 묘사

- **자연물 결합**: "모래의 황동", "강 깊은 곳의 청록", "재의 회흑",
  "포도 잎의 짙은 녹". 색명을 단독으로 두지 않고 자연물 결과 묶는다.
- **결·흐름·번짐의 동사**: "흐른다", "번진다", "어긋난다", "닿는다",
  "걸린다", "흩어진다", "가라앉는다". 색을 살아있게.
- **잔향이라는 명사**: 잊힌 신의 색·E층 흔적은 "잔향" 으로 호명.
  반복 사용 OK (작품 고유 용어).
- **이름 없는 색**: 잊힌 신의 색은 작중 항상 "이름이 없는 색",
  "어떤 색도 아닌 색", "보고 나서 무슨 색이었는지 말로 옮길 수
  없는" 식의 부정형으로만 묘사. 직접 색명 부여 금지.

#### 시점 거리감 (검토 본문 4-2 항목 반영)

검토자 지적 — mythic 결과 한국 웹소설 정주행 호흡의 충돌. 색 묘사
가 그 충돌의 가장 흔한 발생 지점.

- **색 묘사 자체가 사색이 아니다**: 단이 보는 색은 행동·환경의
  일부로 흘러간다. 색을 보고 무슨 의미인지 *해석하는 단락*은 회당
  1회 이하 (자각의 순간만).
- **회 마지막 cliffhanger 의 색**: 시각 이미지 cliffhanger 가 색
  으로 끝나는 게 mythic 결과 정주행 호흡 둘 다 살린다 (회 50 자국
  주위 이름 없는 색 또렷해짐 같은). 적극 활용.
- **속삭임 비용 발동 단락**: 색이 흐려져 보이는 24시간 동안 단의
  지각이 사색에 기울 수밖에 없음. 이 단락이 mythic 결의 자연스러운
  발생점. 단 한 회에 한 단락 이상 늘어지면 정주행 동력 손실. 짧게,
  강하게.

이 가이드는 voice 시필 작성 시 (D1 디버트 해결) 실증으로 다듬는다.
지금은 가설.
