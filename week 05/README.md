# iOS 앱개발 기초반 - 5 주차

### [수업 목표]
1. 인터렉션
    1) 화면 터치
    2) 기기 진동
    3) 애니메이션 심화
2. 인터렉션 앱 구현
3. 광고(AdMob) 넣기
4. Firebase로 사용자 수 확인하기
5. 아카이브와 출시

## 01. 5 주차
1. 터치, 진동, 애니메이션
- 유저에게 생동감 있는 경험을 만들어주는 인터렉션
2. 광고
- AdMob을 이용해 제작한 앱에 광고 삽입
3. Firebase
- Firebase를 이용해 이용자 수를 확인하고 로그(log)를 넣어 사용자에 대한 자세한 기록 획득
4. 앱스토어 출시
- 아카이브를 통한 앱 출시

## 02. 인터렉션
- 유저에게 제공되는 화면을 유저가 누르고 드래그하는 등의 입력을 수행 시, 유저의 생동감 있는 경험을 위해 인터렉션을 신경써야 한다.
    - **impact** : 물리적 충돌 묘사. 충돌 강도에 따라 스타일 지정 가능
    - **selection** : 화면 어떤 요소 선택 시 사용
    - **notification** : 액션에 대해 성공, 실패, 주의

```swift
// 가벼운 물리적 충돌을 묘사
let impactLight = UIImpactFeedbackGenerator(style: .light)
impactLight.impactOccurred()

// 무거운 물리적 충돌을 묘사
let impactHeavy = UIImpactFeedbackGenerator(style: .heavy)
impactHeavy.impactOccurred()

// 어떤 요소를 선택하거나 했을 때 사용
let selection = UISelectionFeedbackGenerator()
selection.selectionChanged()

//notification 은 한 번만 선언해도 됨!
let noti = UINotificationFeedbackGenerator()

//액션의 결과에 따라 각각 성공, 에러, 주의를 위한 진동
noti.notificationOccurred(.success) // 성공
noti.notificationOccurred(.error)   // 에러
noti.notificationOccurred(.warning) // 주의
```

## 03. 인터렉션 앱 구현

## 04. 인터렉션 앱 구현 - 터치
- 화면에 터치 누르기 (시작) - 화면에 터치 움직이기 (중간) - 화면에서 터치 떼기 (끝)

```swift
//터치 시작
override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

}

//터치 이동
override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {

}

//터치 끝
override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {

}

//터치가 비정상적인 이유로 끝남
override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {

}
```

## 05. 인터렉션 앱 구현 - 알고리즘

## 06. 인터렉션 앱 구현 - 애니메이션
- **애니메이션** : 화면에 더욱 생동감을 주는 요소. 자연스러운 전환 제공

```swift
UIView.animate(withDuration: 5) { // 5는 애니메이션이 움직일 시간 길이입니다.
		// 애니메이션이 끝난 후 보였으면 하는 결과물 블록
    view.frame.height = 100
}
```

- 애니메이션의 결과물 블록에 들어갈 수 있는 것
    - 뷰의 frame, bounds, center 등 뷰의 프레임 정보
    - 뷰의 backgroundColor, alpha 등 뷰의 배경색 및 투명도
    - 뷰를 회전하거나 확대하는데 쓰이는 transform
- 이 외에 애니메이션을 넣기 위해서 Timer 사용

## 07. Firebase - 사용자 수

## 08. 광고 넣기

## 09. 앱스토어 출시
