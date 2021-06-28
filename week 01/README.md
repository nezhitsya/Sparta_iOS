# iOS 앱개발 기초반 - 1 주차

### [수업 목표]
1. iOS 개발의 시작과 끝, Xcode 개발툴 익숙해지기
2. 스토리보드(화면 만들기) 기초 다지기
    1) UI 컴포넌트 이해하기
      : 라벨 (UILabel), 이미지뷰 (UIImageView), 버튼 (UIButton)
      2) 이미지 에셋을 관리하는 방법 익히기
      3) @IBAction 과 @IBOutlet 연결하는 방법 익히기
3. Swift 기본 문법 익히기
4. 스크린 손전등 앱 만들기

## 01. 파일 관리
- 폴더 / 파일이 어떤 기능을 하는지 파악할 수 있도록 작성
- 협업 시 함께 정한 규칙대로 관리
- 특수문자는 "-"만 사용

## 02. 필수 프로그램 설치
[Xcode 다운로드](https://apps.apple.com/kr/app/xcode/id497799835?mt=12)

## 03. 개발 도구 사용 & 스토리보드 써보기

## 04. 빌드
단축키 (command + r)

**실제 아이폰에 앱 빌드하기**
```
개발자 등록을 할 필요 X ($99) but 제약사항

1. 한 번에 하나의 앱만 설치 가능
2. 아이폰에서 해당 개발자에 대해서 신뢰하기 설정
```

1. Xcode에 애플 로그인
- Xcode 상단 Xocde -> Preferences...
<img width="500" src="https://user-images.githubusercontent.com/60697742/123584812-ff5e8300-d81c-11eb-96fd-8f198e6a1245.png">

- Accounts에서 Apple ID 넣기 (왼쪽 하단 + 버튼)
<img width="500" src="https://user-images.githubusercontent.com/60697742/123584853-0f766280-d81d-11eb-97b8-e42446352983.png">

- Apple ID 선택하고 로그인
<img width="500" src="https://user-images.githubusercontent.com/60697742/123584858-10a78f80-d81d-11eb-8720-1764200544eb.png">

2. 프로젝트를 로그인한 아이디로 설정
- 프로젝트 설정 -> Targets에서 해당 앱 -> Signing & Capabilities
<img width="500" src="https://user-images.githubusercontent.com/60697742/123584859-11d8bc80-d81d-11eb-99b4-b7d84c4503a7.png">

- Automatically manage signing 체크 + Team에 로그인한 아이디 선택
<img width="500" src="https://user-images.githubusercontent.com/60697742/123585368-118cf100-d81e-11eb-9771-d507f8395502.png">

## 05. 이미지뷰와 이미지 에셋
