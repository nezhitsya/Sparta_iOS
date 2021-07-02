# Auto Fill Text

<p align="center">
  <img width="300" src="https://user-images.githubusercontent.com/60697742/123888270-18d30c80-d98e-11eb-9456-b9884dc90e63.mov">
</p>

## 화면 구성

<img width="700" src="https://user-images.githubusercontent.com/60697742/123888262-14a6ef00-d98e-11eb-8e27-ae1742458f34.png">

**TextField** - 텍스트 필드 <br>
**Button** - 채우기 / 지우기 버튼 <br>

### Outlet Collection

하나의 Outlet에 여러 컴포넌트를 연결하기 위해 사용한다.

<img width="700" src="https://user-images.githubusercontent.com/60697742/123888266-17a1df80-d98e-11eb-9f08-3aa7f612af06.png">

Outlet Collection을 선택해 Outlet을 생성 후, 해당 컴포넌트들을 일일이 연결해주어야 한다.

### Code

**채우기 버튼 액션**
몇 번째 텍스트 필드인지 저장할 변수(i)를 설정해 준 후 버튼이 눌릴 때마다 1씩 증가하여 텍스트가 채워질 수 있도록 한다.

```swift
@IBAction func touchUpAutoFillButton(_ sender: Any) {
    textFields[i].text = "안녕하세요~~😀"
    i += 1
}
```

**지우기 버튼 액션**
반복문을 이용해 모든 텍스트 필드가 지워질 수 있도록 한다.
모두 지워지면 다시 텍스트를 채울때 처음부터 채워지게 하기 위해서 위의 변수(i)를 0으로 초기화해준다.

```swift
@IBAction func touchUpEraseButton(_ sender: Any) {
    for i in 0..<textFields.count {
        var textField = textFields[i]
        textField.text = ""
    }

    i = 0
}
```
