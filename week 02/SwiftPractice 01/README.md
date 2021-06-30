# Poker

<p align="center">
  <img width="300" src="https://user-images.githubusercontent.com/60697742/123884270-d6a5cd00-d985-11eb-8e96-0c2f1c2e586d.mov">
</p>

## 화면 구성

<img width="300" src="https://images.velog.io/images/nezhitsya/post/0faca232-bcc1-4096-844e-702775858b0c/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7%202021-06-29%20%EC%98%A4%EC%A0%84%209.13.57.png">

**ImageView** - Flashlight 이미지 삽입
**Label** - App Title
**Button** - On / Off 버튼

### App Icon

제공되는 App Icon Set을 이용하여 Icon 설정

1. Assets.xcassets에 AppIcon을 선택한다.

```
만약 없다면
_하단의 + 버튼 -> iOS -> iOS App Icon_
```

<img width="300" src="https://images.velog.io/images/nezhitsya/post/727891b3-9328-4c75-84f4-84198b5fd68d/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7%202021-06-29%20%EC%98%A4%EC%A0%84%209.23.21.png">


2. 값에 맞는 이미지를 옮겨준다.

<img width="300" src="https://images.velog.io/images/nezhitsya/post/bfba34a5-3a9d-40e7-97d6-6cc738ee9e06/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7%202021-06-29%20%EC%98%A4%EC%A0%84%209.25.34.png">

제공되는 아이콘은 위와같이 20x20 1x, 20x20 2x, 20x20 3x로 제공된다.

<img width="300" src="https://images.velog.io/images/nezhitsya/post/31f7a83f-dea6-49cb-8c94-92d61106e2db/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7%202021-06-29%20%EC%98%A4%EC%A0%84%209.27.27.png">

하지만 App Icon은 위와같이 40x40 58x58 크기의 이미지를 넣으라고 안내되어있다.
따라서 제공되는 아이콘의 크기 값을 계산해서 삽입하여야 한다.

예를들어, 40x40에는 20x20 2x 아이콘 또는 40x40 1x가 들어갈 수 있다. 58x58에는 29x29 2x가, 120x120에는 40x40 3x 또는 60x60 2x가 들어갈 수 있다.

### Color Assets

Assets.xcassets에 자신이 원하는 색을 넣을 수 있다.

하단의 + 버튼 -> Color Set 에서 설정이 가능하다.

<img width="300" src="https://images.velog.io/images/nezhitsya/post/b7d42b65-5ddf-4487-87e5-0011b8227a60/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7%202021-06-29%20%EC%98%A4%EC%A0%84%209.54.56.png">

아래와 같이 각각 평소 색상과 Dark 모드 적용시 나타날 색상을 지정할 수 있다.

<img width="300" src="https://images.velog.io/images/nezhitsya/post/af86cc13-48fe-4da2-a219-0e4ceed47f57/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7%202021-06-29%20%EC%98%A4%EC%A0%84%209.55.57.png">

색 지정은 값을 직접 입력해주거나 **Show Color Panel**을 선택해 색상 페널에서 지정 가능하다.

<img width="300" src="https://images.velog.io/images/nezhitsya/post/4ae15e9d-f3d0-4c86-bee1-6e1c108b1d42/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7%202021-06-29%20%EC%98%A4%EC%A0%84%209.57.12.png">

### Code

어플은 Flashlight가 Off 상태일 때부터 시작한다.
따라서 Off 상태의 화면으로 구현해준다.

Off 상태 화면의 배경 색상과 app title의 색상을 **viewDidLoad()**에 구현해준다.

```
off 상태 배경 색상이 system에서 제공되는 color가 아니어서 color set을 지정하여 storyboard에 구현해주면 되지만 학습 및 과제 차원에서 code로 구현하였다.
```

ViewDidLoad는 뷰가 로드될 때의 상태이다. 즉, 뷰가 나타날때 화면 색상과 app title 색상이 구현된다.

```swift
override func viewDidLoad() {
    super.viewDidLoad()

    appTitle.textColor = UIColor.lightGray
    view.backgroundColor = UIColor(red: 0.17, green: 0.25, blue: 0.30, alpha: 1.00)
}
```

각각 On 버튼과 Off 버튼이 눌러졌을 때의 액션 코드이다.

On 버튼 또는 Off 버튼이 눌렸을 때의 app title의 색상, flashlight 이미지, 배경 색상을 지정해준다.

```swift
@IBAction func touchUpOnButton(_ sender: Any) {
    appTitle.textColor = UIColor.black
    flash.image = UIImage(systemName: "flashlight.on.fill")
    view.backgroundColor = UIColor(red: 0.93, green: 0.70, blue: 0.25, alpha: 1.00)
}

@IBAction func touchUpOffButton(_ sender: Any) {
    appTitle.textColor = UIColor.lightGray
    flash.image = UIImage(systemName: "flashlight.off.fill")
    view.backgroundColor = UIColor(red: 0.17, green: 0.25, blue: 0.30, alpha: 1.00)
}
```
