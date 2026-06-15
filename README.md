# 📱 iOS Practice — Swift · UIKit 학습 기록

![Swift](https://img.shields.io/badge/Swift-5-FA7343?style=flat&logo=swift&logoColor=white)
![UIKit](https://img.shields.io/badge/UIKit-2396F3?style=flat&logo=apple&logoColor=white)
![Xcode](https://img.shields.io/badge/Xcode-147EFB?style=flat&logo=xcode&logoColor=white)
![iOS](https://img.shields.io/badge/iOS-000000?style=flat&logo=apple&logoColor=white)

> **Swift · UIKit로 만든 iOS 앱 실습 모음** — 기초 문법부터 BMI 계산, 환율 변환, WebView/동영상 재생까지 단계별로 익힌 학습 저장소입니다.
> (인덕대학교 iOS 프로그래밍 수강 + **iOS 전공 멘토** 활동 과정에서 작성)

📅 **개발 기간:** 2025.09 ~ 2025.12 (2학년 2학기)

---

## 📦 앱 목록

| 앱 | 한 줄 | 핵심 학습 |
|---|---|---|
| 👋 **Ranghello** | 이름 입력 → 인사 출력하는 첫 앱 | IBOutlet/IBAction, UILabel·UITextField 바인딩 |
| ⚖️ **BMI** | 키·몸무게로 BMI 계산 + 단계 판정 | `enum`·`struct` 모델 분리, WebView·동영상 재생 |
| 💱 **exchange-rate-calculator** | 원화 → 달러 환산기 (iOS 학기말 과제) | 입력 검증(`guard`), `NumberFormatter`, 멀티 화면 |

## 🔧 학습하며 익힌 점

- **MVC 분리** — BMI 앱에서 계산 로직을 `BMI` struct / `BMICategory` enum으로 분리해 ViewController는 표현만 담당
- **안전한 입력 처리** — 환율 계산기에서 `guard let` + 옵셔널 바인딩으로 빈 값·0·문자 입력을 방어하고 사용자에게 피드백
- **UIKit 기본기** — IBOutlet/IBAction 연결, 키보드 제스처 닫기, `NumberFormatter`로 소수점 포맷, WebView·AVPlayer로 화면 전환

## 📁 구조

```
ios-practice/
├── Ranghello/                  # 첫 UIKit 앱 (인사 출력)
├── BMI/                        # BMI 계산 + 단계 판정 (enum/struct 모델)
└── exchange-rate-calculator/   # 원→달러 환율 계산기 (학기말 과제)
```

각 폴더는 독립 Xcode 프로젝트입니다 — `.xcodeproj`를 Xcode로 열어 시뮬레이터에서 실행하세요.

> 📝 학습용 실습 저장소입니다. UIKit + Storyboard 기반으로, 개념을 직접 앱으로 구현하며 익히는 데 초점을 뒀습니다.
