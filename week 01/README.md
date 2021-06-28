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
<img width="700" src="https://user-images.githubusercontent.com/60697742/123584812-ff5e8300-d81c-11eb-96fd-8f198e6a1245.png">

- Accounts에서 Apple ID 넣기 (왼쪽 하단 + 버튼)
<img width="700" src="https://user-images.githubusercontent.com/60697742/123584853-0f766280-d81d-11eb-97b8-e42446352983.png">

- Apple ID 선택하고 로그인
<img width="700" src="https://user-images.githubusercontent.com/60697742/123584858-10a78f80-d81d-11eb-8720-1764200544eb.png">

2. 프로젝트를 로그인한 아이디로 설정
- 프로젝트 설정 -> Targets에서 해당 앱 -> Signing & Capabilities
<img width="700" src="https://user-images.githubusercontent.com/60697742/123584859-11d8bc80-d81d-11eb-99b4-b7d84c4503a7.png">

- Automatically manage signing 체크 + Team에 로그인한 아이디 선택
<img width="700" src="https://user-images.githubusercontent.com/60697742/123585368-118cf100-d81e-11eb-9771-d507f8395502.png">

3. 아이폰을 연결하고 빌드 대상을 해당 아이폰으로 선택

4. 오류
```
앱 개발자 등록 시, 오류 발생 X
```
**Could not launch "App name"** 이라는 오류가 발생한다면 ...

- 아이폰 설정 -> 기기관 -> ...
<img width="700" src="https://user-images.githubusercontent.com/60697742/123585900-e951c200-d81e-11eb-86cd-0d7a56a19677.png">

- App Development: ... 선택 -> 신뢰
<img width="700" src="https://user-images.githubusercontent.com/60697742/123586012-17cf9d00-d81f-11eb-9a12-e2a786e44a05.png">

**Unable to install "App name"** 이라는 오류가 발생한다면 ...
- 이전에 설치한 어플 삭제 후 다시 빌드

## 05. 이미지뷰와 이미지 에셋
- UIImageView
Library 단축키 (command + shift + l)
[https://developer.apple.com/sf-symbols/](https://developer.apple.com/sf-symbols/) 에서 시스템 아이콘 확인

- Image Assets
1. 네비게이션 탭에서 Assets.xcassets 선택
<img width="700" src="https://user-images.githubusercontent.com/60697742/123587048-a5f85300-d820-11eb-8b26-2e29a2792462.png">

2. 하단의 + 버튼을 눌러 Image Set 선택
<img width="700" src="https://user-images.githubusercontent.com/60697742/123587055-a7298000-d820-11eb-81ec-fc32ff35b5be.png">

3. 이미지를 1x에 넣기
<img width="700" src="https://user-images.githubusercontent.com/60697742/123587058-a85aad00-d820-11eb-9061-dbd2ac8b13cd.png">

**해상도**
배수(scale factor)가 늘어날수록 선명해진다.

<p align="center">
  <img width="700" src="https://user-images.githubusercontent.com/60697742/123587219-ece64880-d820-11eb-8b5e-d9cda44fdced.png">
</p>

iOS에서는 포인트(Point) 단위를 사용하여 픽셀(Pixel)과 다르게 해상도가 높아져도 포인트에 변화 X

[이미지 편집 사이트](https://appicon.co)에서 자동으로 1x부터 3x 이미지 생성

## 06. Swift 맛보기
- Assistant 화면 띄우기 단축키 (command + option + control + Enter)
<img width="700" src="https://user-images.githubusercontent.com/60697742/123587730-a9400e80-d821-11eb-8ab4-acd3bc1bfa7b.png">

- Build and run 단축키 (command + r)

- Connection
Label 또는 ImageView를 control 키와 함께 드래그해서 코드에 연결해준다.

<img width="700" src="https://user-images.githubusercontent.com/60697742/123589455-37b58f80-d824-11eb-976e-df6966fbe527.png">

```swift
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var flash: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}
```

## 07. Swift 기초 문법 - 변수 선언과 기본 데이터 타입
- var로 변수를 선언
    - 변수명 형식 - 코딩 컨벤션 (코딩 규칙, coding convention)
    - snake case : 단어를 _ 로 연결
    ```swift
    var first_name = "Dayeong"
    ```
    - camel case : 단어가 연결되는 부분의 첫 글자를 대문자로 작성
    ```swift
    var firstName = "Dayeong"
    ```
- 사칙연산
```swift
var num1 = 11
var num2 = 20

print(num1 + num2) // 31
print(num1 * num2) // 220
print(num2 / num1) // 1
```

```swift
var firstName = "Dayeong"
var lastName = "Lee"

print(firstName + " " + lastName) // Dayeong Lee
print("\(firstName)~\(lastName)") // Dayeong~Lee
```
- 참 거짓 True False 자료형
```swift
var birth = 1120
var isTrue = (birth == 1120) // True
var isFalse = (birth != 1120) // False

print(isTrue && isFalse) // False
print(isTrue || isFalse) // True
```

- && || 구분
<p align="center">
  <img width="400" src="https://user-images.githubusercontent.com/60697742/123588526-db9e3b80-d822-11eb-81a8-76b469b2ec63.png">
</p>

## 08. Swift 기초 문법 - 리스트, 딕셔너리, 함수
- 리스트 (List) : 순서를 가지고 있는 형태

```swift
var sampleList: [Int] = [] // 빈 리스트 선언
var sampleList = [1, 2, 3, 4]

print(sampleList[0]) // 1
sampleList.append(5) // 리스트 요소 추가
print(sampleList.count) // 5
```

- 딕셔너리 (Dictionary) : 키 - 값이 쌍을 이루고 있는 형태
```
var sampleDict: [String: String] = [:] // 빈 딕셔너리 선언
var sampleDict: [String: String] = ["name": "Dayeong", "birth": "1120"]

print(sampleDict["name"]) // Dayeong
sampleDict["city"] = "Seoul"
print(sampleDict) // ["name": "Dayeong", "birth": "1120", "city": "Seoul"]
```
