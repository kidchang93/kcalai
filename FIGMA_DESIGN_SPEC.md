# K-Cal AI Figma 디자인 스펙

이 문서는 Flutter 앱의 모든 화면을 Figma에서 재현하기 위한 상세 디자인 가이드입니다.

---

## 📐 기본 설정

### 화면 크기
- **디바이스**: iPhone 14 Pro (393 × 852px) 또는 Android 기준 (360 × 640px)
- **Safe Area**: 상단 44px, 하단 34px 고려
- **그리드**: 8px 베이스 그리드 시스템 사용

### 색상 팔레트

#### Primary Colors
- **메인 그린**: `#4CAF50` (RGB: 76, 175, 80)
- **다크 그린**: `#45B649` (RGB: 69, 182, 73)
- **라이트 그린**: `#4CAF50` with 10% opacity (배경)

#### Secondary Colors
- **퍼플**: `#9A93DA` (RGB: 154, 147, 218)
- **다크 퍼플**: `#7B73C0` (RGB: 123, 115, 192)

#### Neutral Colors
- **Black**: `#000000` / `#000000` with 87% opacity (텍스트)
- **White**: `#FFFFFF`
- **Grey 50**: `#FAFAFA`
- **Grey 200**: `#EEEEEE`
- **Grey 300**: `#E0E0E0`
- **Grey 600**: `#757575` (Secondary 텍스트)

#### Accent Colors
- **Orange**: `#FB8C00` / `#FF9800` (600 tint)

### 타이포그래피

#### 폰트 패밀리
- **한글/영문**: Pretendard 또는 SF Pro (iOS) / Roboto (Android)

#### 텍스트 스타일

**Title Large**
- Font Size: 48px
- Font Weight: Bold (700)
- Letter Spacing: 2px
- Color: White

**Title Medium**
- Font Size: 24px
- Font Weight: Bold (700)
- Color: Black87 / White

**Title Small**
- Font Size: 20px
- Font Weight: Bold (700)
- Color: Black87

**Body Large**
- Font Size: 18px
- Font Weight: Medium (500) / Bold (700)
- Color: Black87

**Body Medium**
- Font Size: 16px
- Font Weight: Regular (400) / Medium (500) / Bold (700)
- Color: Black87 / White

**Body Small**
- Font Size: 14px
- Font Weight: Regular (400) / Medium (500) / Bold (700)
- Color: Black87 / White70

**Caption**
- Font Size: 12px
- Font Weight: Medium (500)
- Color: White

### 아이콘
- **Material Icons** 또는 **SF Symbols** (iOS)
- **기본 사이즈**: 20px, 24px, 28px, 32px, 48px, 80px

---

## 🏠 화면 1: 홈 화면 (HomeScreen)

### 배경
- **타입**: Linear Gradient
- **방향**: Top Left → Bottom Right
- **색상 스톱**:
  1. `#9A93DA` (0%)
  2. `#7B73C0` (50%)
  3. `#4CAF50` (100%)

### 레이아웃 구조

#### 1. 상단 여백 (Spacer)
- **높이**: Flexible (화면 크기에 맞게 자동)

#### 2. 로고/아이콘 영역
- **타입**: Container
- **크기**: 128px × 128px (패딩 24px 포함)
- **모양**: Circle
- **배경색**: White with 20% opacity
- **그림자**:
  - Color: Black 10% opacity
  - Blur: 20px
  - Spread: 5px
- **아이콘**: `restaurant_menu`
  - Size: 80px
  - Color: White
- **위치**: 화면 중앙 상단

#### 3. 타이틀
- **텍스트**: "K-Cal AI"
- **스타일**: Title Large
- **Color**: White
- **그림자**:
  - Color: Black 26% opacity
  - Offset: (0, 4)
  - Blur: 8px
- **위치**: 로고 아래 40px

#### 4. 서브타이틀
- **컨테이너**:
  - 배경색: White 20% opacity
  - Border Radius: 30px
  - 패딩: Horizontal 32px, Vertical 12px
- **텍스트**: "음식 사진 만으로 칼로리 측정"
- **스타일**: Body Medium
- **Font Weight**: Medium (500)
- **Color**: White
- **위치**: 타이틀 아래 16px

#### 5. 기능 소개 카드들 (3개)
- **레이아웃**: Row, Space Evenly
- **각 카드**:
  - 배경색: White 20% opacity
  - Border: White 30% opacity, 1px
  - Border Radius: 16px
  - 패딩: 16px
  - **내용**:
    - 아이콘: 32px, White
    - 텍스트: Caption, White, Medium
  - **카드 1**: `camera_alt` + "촬영"
  - **카드 2**: `analytics` + "분석"
  - **카드 3**: `fastfood` + "영양정보"
- **위치**: 서브타이틀 아래 40px
- **간격**: 가로 32px 패딩

#### 6. 시작 버튼
- **위치**: 하단 여백 (Spacer) 위
- **패딩**: Horizontal 32px, Vertical 32px
- **버튼 스타일**: Custom (참고용 - 실제 버튼 파일 확인 필요)

---

## 📷 화면 2: 카메라 촬영 화면 (CameraView)

### 배경
- **색상**: Black (`#000000`)

### 레이아웃 구조

#### 1. 카메라 프리뷰 영역
- **위치**: 화면 중앙
- **크기**: 화면 너비 기준, 3:4 비율 (Aspect Ratio)
- **컨테이너**:
  - 배경색: Black
  - Border Radius: 20px
  - 그림자:
    - Color: `#4CAF50` 30% opacity
    - Blur: 20px
    - Spread: 5px
- **내부**: 카메라 프리뷰 또는 로딩 인디케이터

#### 2. 상단 컨트롤 영역
- **위치**: Top (Safe Area 내)
- **배경**: Linear Gradient (Top → Bottom)
  - Black 60% opacity → Transparent
- **패딩**: Horizontal 8px, Vertical 8px
- **컨트롤 버튼들** (왼쪽부터):
  - **뒤로 가기** (`arrow_back_ios`)
  - **Spacer** (중앙)
  - **플래시** (`flash_on` / `flash_off`)
    - Active: Green 배경 (`#4CAF50` 80%), White Border 2px
  - **카메라 전환** (`cameraswitch`)
  - **버튼 스타일**:
    - 크기: 48px × 48px (Circle)
    - 배경: Black 50% opacity (일반), Green 80% (Active)
    - Border: White 2px (Active만)
    - 아이콘: White, 26px

#### 3. 중앙 안내 텍스트 (애니메이션)
- **위치**: 카메라 프리뷰 위, 상단에서 60px
- **컨테이너**:
  - 배경색: Black 60% opacity
  - Border Radius: 25px
  - 패딩: Horizontal 24px, Vertical 12px
- **내용**: 
  - 아이콘: `camera_alt`, White, 20px
  - 텍스트: "음식을 프레임에 맞춰주세요"
    - Style: Body Small
    - Weight: Medium
    - Color: White
- **애니메이션**: 2초 후 Fade Out (Figma에서는 두 프레임으로 표현)

#### 4. 하단 촬영 버튼 영역
- **위치**: Bottom (Safe Area 고려)
- **배경**: Linear Gradient (Bottom → Top)
  - Black 60% opacity → Transparent
- **패딩**: Top 32px, Bottom 32px
- **촬영 버튼**:
  - 크기: 72px × 72px (Circle)
  - Border: White, 4px
  - 배경색: 
    - 활성: `#4CAF50` 30% opacity
    - 비활성: Grey 30% opacity
  - 아이콘: `camera`, White / Grey, 32px
  - 위치: 화면 중앙 하단

---

## 📊 화면 3: 분석 결과 화면 (ResultWidget)

### 배경
- **타입**: Linear Gradient
- **방향**: Top → Bottom
- **색상**:
  1. Grey 50 (`#FAFAFA`)
  2. White (`#FFFFFF`)

### 레이아웃 구조 (상→하)

#### 1. 헤더
- **패딩**: 20px (All)
- **내용**:
  - **아이콘 컨테이너**:
    - 크기: 52px × 52px (패딩 12px 포함)
    - 배경색: `#4CAF50` 10% opacity
    - Border Radius: 12px
    - 아이콘: `analytics`, `#4CAF50`, 28px
  - **텍스트**: "분석 결과"
    - Style: Title Medium
    - Color: Black87
  - **간격**: 12px

#### 2. 예측 리스트 카드
- **마진**: Horizontal 20px
- **카드**:
  - 배경색: White
  - Border Radius: 20px
  - 그림자:
    - Color: Black 5% opacity
    - Blur: 10px
    - Offset: (0, 4)
  - **패딩**: 16px
- **리스트 아이템** (각 예측 항목):
  - **일반 항목**:
    - 패딩: 12px
    - 배경: Transparent
  - **Top 항목** (가장 높은 점수):
    - 배경색: `#4CAF50` 10% opacity
    - Border: `#4CAF50` 30% opacity, 2px
    - Border Radius: 12px
    - **체크 아이콘**: `check_circle`, `#4CAF50`, 24px (아이콘 옆)
  - **내용**:
    - 텍스트: 음식 이름
      - 일반: Body Large, Medium
      - Top: Body Large, Bold
      - Color: Black87
    - **점수 배지**:
      - 일반: Grey 300 배경, Black54 텍스트
      - Top: `#4CAF50` 배경, White 텍스트
      - 패딩: Horizontal 12px, Vertical 6px
      - Border Radius: 20px
      - 텍스트: Body Medium, Bold
      - 형식: "XX.X%"
  - **구분선**: Grey 200, 24px 간격

#### 3. 영양 정보 카드
- **마진**: 20px (All)
- **카드**:
  - 배경: Linear Gradient
    - `#4CAF50` → `#45B649`
    - 방향: Top Left → Bottom Right
  - Border Radius: 20px
  - 그림자:
    - Color: `#4CAF50` 30% opacity
    - Blur: 15px
    - Offset: (0, 8)
  - **패딩**: 24px
- **내용** (세로 중앙 정렬):
  - 아이콘: `restaurant_menu`, White, 32px
  - 간격: 12px
  - 음식 이름: Title Medium, White, Bold
  - 간격: 8px
  - 정확도: Body Medium, White70
    - 형식: "정확도: XX.X%"
  - 간격: 16px
  - 안내 텍스트: Body Small, White
    - "칼로리와 영양 정보를 알려드릴까요?"
  - 간격: 16px
  - **버튼**: "영양 정보 보기"
    - 배경색: White
    - 텍스트: `#4CAF50`, Body Medium, Bold
    - 패딩: Horizontal 32px, Vertical 12px
    - Border Radius: 25px
    - Elevation: 0
    - 아이콘: `search`, 20px
    - 간격: 8px

#### 4. 수동 입력 섹션
- **마진**: Horizontal 20px
- **카드**:
  - 배경색: White
  - Border Radius: 20px
  - 그림자:
    - Color: Black 5% opacity
    - Blur: 10px
    - Offset: (0, 4)
  - **패딩**: 20px
- **내용**:
  - **헤더**:
    - 아이콘: `edit`, Orange 600, 20px
    - 텍스트: "일치하는 음식이 없나요?"
      - Body Small, Orange 600, Bold
    - 간격: 8px
  - 간격: 12px
  - **입력 영역** (Row):
    - **텍스트 필드** (Expanded):
      - 배경색: Grey 50
      - Border: Grey 300, 1px
      - Border Radius: 12px
      - Focus Border: `#9A93DA`, 2px
      - 패딩: Horizontal 16px, Vertical 12px
      - 플레이스홀더: "음식 이름을 입력하세요"
    - 간격: 8px
    - **검색 버튼**:
      - 배경색: `#4CAF50`
      - 크기: 48px × 48px
      - Border Radius: 12px
      - 아이콘: `search`, White
      - Elevation: 0

#### 5. 액션 버튼 영역
- **패딩**: 20px (All)
- **레이아웃**: Row, 두 버튼 동일 너비
- **버튼 1**: "다시 촬영"
  - 타입: Elevated Button
  - 배경색: `#4CAF50`
  - 텍스트: White, Body Medium, Bold
  - 아이콘: `camera_alt`, 20px
  - 패딩: Vertical 16px
  - Border Radius: 12px
  - Elevation: 0
- **간격**: 12px
- **버튼 2**: "홈으로"
  - 타입: Outlined Button
  - Border: `#4CAF50`, 2px
  - 텍스트: `#4CAF50`, Body Medium, Bold
  - 아이콘: `home`, 20px
  - 패딩: Vertical 16px
  - Border Radius: 12px

---

## 🍎 화면 4: 영양 정보 화면 (NutritionViewWidget)

### 배경
- **색상**: Grey 50 (`#FAFAFA`)

### 레이아웃 구조

#### 1. App Bar
- **배경**: Transparent
- **Elevation**: 0
- **내용**:
  - 뒤로 가기: `arrow_back_ios`, Black87
  - 제목: "영양 정보"
    - Title Small, Black87, Bold
    - 중앙 정렬

#### 2. 메인 카드
- **마진**: 20px (All)
- **카드**:
  - 배경: Linear Gradient
    - `#4CAF50` → `#45B649`
    - 방향: Top Left → Bottom Right
  - Border Radius: 20px
  - 그림자:
    - Color: `#4CAF50` 30% opacity
    - Blur: 15px
    - Offset: (0, 8)
  - **패딩**: 24px
- **내용** (세로 중앙 정렬):
  - 아이콘: `restaurant_menu`, White, 48px
  - 간격: 12px
  - 제목: "음식 분석 결과"
    - Title Medium, White, Bold
  - 간격: 4px
  - 서브텍스트: "AI가 분석한 영양 정보입니다"
    - Body Small, White70

#### 3. 상세 정보 카드
- **마진**: Top 24px, Horizontal 20px
- **카드**:
  - 배경색: White
  - Border Radius: 20px
  - 그림자:
    - Color: Black 5% opacity
    - Blur: 10px
    - Offset: (0, 4)
  - **패딩**: 24px
- **내용**:
  - **헤더**:
    - 아이콘 컨테이너:
      - 크기: 40px × 40px (패딩 8px 포함)
      - 배경색: `#4CAF50` 10% opacity
      - Border Radius: 10px
      - 아이콘: `info_outline`, `#4CAF50`, 24px
    - 텍스트: "상세 정보"
      - Title Small, Black87, Bold
    - 간격: 12px
  - 간격: 20px
  - **정보 박스**:
    - 배경색: Grey 50
    - Border: Grey 200, 1px
    - Border Radius: 12px
    - 패딩: 16px
    - 텍스트: Body Medium, Black87
      - Line Height: 1.6
      - Letter Spacing: 0.3

#### 4. 추가 정보 카드
- **마진**: Top 24px, Horizontal 20px
- **카드**:
  - 배경색: White
  - Border Radius: 20px
  - 그림자:
    - Color: Black 5% opacity
    - Blur: 10px
    - Offset: (0, 4)
  - **패딩**: 20px
- **내용**:
  - 아이콘: `lightbulb_outline`, Orange 400, 24px
  - 텍스트: "건강한 식습관을 유지하세요!"
    - Body Small, Black87, Medium
  - 간격: 12px

---

## 🎨 Figma 컴포넌트 가이드

### 재사용 가능한 컴포넌트

1. **Primary Button**
   - 배경색: `#4CAF50`
   - 텍스트: White, Body Medium, Bold
   - Border Radius: 12px
   - 패딩: Vertical 16px

2. **Outlined Button**
   - Border: `#4CAF50`, 2px
   - 텍스트: `#4CAF50`, Body Medium, Bold
   - Border Radius: 12px

3. **Card Container**
   - 배경색: White
   - Border Radius: 20px
   - 그림자: Black 5% opacity, Blur 10px, Offset (0, 4)

4. **Gradient Card** (Primary)
   - 배경: `#4CAF50` → `#45B649`
   - Border Radius: 20px
   - 그림자: `#4CAF50` 30% opacity, Blur 15px, Offset (0, 8)

5. **Input Field**
   - 배경색: Grey 50
   - Border: Grey 300, 1px
   - Focus Border: `#9A93DA`, 2px
   - Border Radius: 12px
   - 패딩: Horizontal 16px, Vertical 12px

6. **Icon Container** (Small)
   - 크기: 40-52px × 40-52px
   - 배경색: `#4CAF50` 10% opacity
   - Border Radius: 10-12px
   - 패딩: 8-12px

---

## 📝 Figma 작업 팁

1. **Auto Layout 사용**: 모든 레이아웃은 Auto Layout으로 구성하여 반응형 디자인 구현
2. **Component 생성**: 재사용 가능한 요소는 Component로 만들어 관리
3. **Style 생성**: Colors, Typography는 Style로 등록하여 일관성 유지
4. **Frame Hierarchy**:
   - Frame: Screen (393 × 852)
     - Frame: Safe Area Container
       - Frame: Content Area
5. **그림자 효과**: Shadow 필터 사용
6. **그라디언트**: Fill 타입을 Linear Gradient로 설정

---

## 🔄 화면 간 전환 플로우

1. **홈 화면** → 시작 버튼 클릭 → **카메라 화면**
2. **카메라 화면** → 촬영 → **결과 화면**
3. **결과 화면** → "영양 정보 보기" 클릭 → **영양 정보 화면**
4. **결과 화면** → "다시 촬영" → **카메라 화면**
5. **결과 화면** → "홈으로" → **홈 화면**

---

## ✅ 체크리스트

각 화면 제작 시 확인 사항:
- [ ] 색상 값 정확히 입력
- [ ] 간격 8px 베이스로 조정
- [ ] 타이포그래피 스타일 일치
- [ ] 그림자 효과 적용
- [ ] Border Radius 값 확인
- [ ] 아이콘 크기 및 색상 확인
- [ ] Auto Layout 설정
- [ ] 컴포넌트화된 요소 분리
- [ ] Safe Area 고려
- [ ] 스크롤 영역 표시 (필요시)

---

이 스펙을 따라 Figma에서 디자인을 재현하시면 됩니다. 추가 질문이나 수정 사항이 있으시면 알려주세요!
