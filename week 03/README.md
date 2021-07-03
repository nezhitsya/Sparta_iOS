# iOS 앱개발 기초반 - 3 주차

### [수업 목표]
1. iOS에서 뷰의 위치 다루기
2. UITableView 중 Static 방법
3. 화면 전환
    1) UIViewController를 나타내는 법 (Present)
    2) UINavigationController로 화면전환
4. Swift 문법 중 상속과 클로져(closure)
5. 앱 만들기

## 01. 3 주차
1. 뷰의 frame & constraint
- 프레임 (frame)
    - 위치 좌표(x, y)와 사이즈(너비, 높이)로 이루어진 사각형
    - 프레임을 통해 뷰의 위치와 사이즈를 결정
- 컨스트레인트 (constraint)
    - 특정 규칙을 통해 화면 크기가 달라져도 뷰의 위치와 사이즈가 일관되게 유지

2. 화면 전환
**UIViewController** : iOS에서 화면의 기본 단위. 뷰를 컨트롤 하는 개념

3. 상속 & 클로져
- 상속
    - A를 상속받았을 때, 따로 코드를 작성하지 않아도 A가 동작하는 원리를 사용할 수 있도록 해주는 기능
- 클로져
    - 작성한 함수를 다른 함수의 변수로 사용

## 02. iOS에서 뷰의 위치를 다루는 법 1
- 프레임 (frame)
    - 화면에서 뷰의 크기와 위치 결정
    - 위치 좌표 (x, y)와 사이즈 (너비, 높이)로 이루어진 사각형으로, 뷰의 위치와 사이즈 결정
    - 왼쪽 상단은 (0, 0) = 원점
    **상위뷰 (supterview) & 하위뷰 (subview)** <br>
    A라는 뷰가 B라는 뷰를 포함할 때 A는 상위뷰, B는 하위뷰라 한다. = 트리구조

```swift
self.imageView.frame = CGRect(x: 20, y: 200, width: 237, height: 235)
```

## 03. iOS에서 뷰의 위치를 다루는 법 2
- 컨스트레인트 (constraint)
    - 뷰의 위치와 사이즈에 대한 규칙을 컨스트레인트로 정하면, 화면 사이즈가 변하여도 규칙으로 프레임 고정
    - 컨스트레인트는 프레임을 결정하는 룰

## 04. 여러 화면 다뤄보기
- 화면 표시 방법 (Presentation Style)
    - 자동 (Automatic)
    - 전체 화면 (Full Screen)
    - 페이지 시트 (Page Sheet)
- 화면 전환 방법 (Transition Style)
    - Cover Vertical
    - Flip Horizontal
    - Cross Dissolve
    - Partial Curl

## 05. 내비게이션과 테이블 뷰
- 내비게이션 컨트롤러 (UINavigationController)
    - 화면 전환을 관리해 주는 UIViewController의 일종
    - 각각의 화면을 내비게이션 컨트롤러에 한 장씩 쌓아 올리는 Stack 구조
