# Fibonachicken

<p align="center">
  <img width="300" src="https://user-images.githubusercontent.com/60697742/124406022-1fd99080-dd7b-11eb-8fb9-863271696e3c.mov">
</p>

## 화면 구성

<img width="700" src="https://user-images.githubusercontent.com/60697742/124406231-b312c600-dd7b-11eb-8cfd-93b2c3ca16a3.png">

**Stepper** - 인원수 조정 <br>
**TextField** - 인원수 표시 및 입력 <br>

### Code

**[ Input Controller ]** <br>

stepper의 값을 textField에 표시

```swift
@IBAction func textEditingChanged(_ sender: Any) {
    // text 가 nil 이라면 "" 디폴트 값 설정
    var text = textField.text ?? ""
    // text를 Double 변경 실패 시 0 디폴트 값 설정
    stepper.value = Double(text) ?? 0
}
```

textField에 값을 입력 시 stepper의 value에 반영

```swift
@IBAction func stepperValueChanged(_ sender: Any) {
    var value = stepper.value
    textField.text = String(Int(value))
}
```

controller 이동 및 값 전달

```swift
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {      
    if var controller = segue.destination as? OutputViewController {
        controller.numOfPeople = Int(stepper.value)
    }      
}
```

**[ Output Controller ]** <br>

피보나치 함수 구현

```swift
func fibonacci(x: Int) -> Int {
    if x == 0 {
        return 0
    }

    if x == 1 {
        return 1
    }

    var a = 1
    var b = 1

    while true {
        var c = a + b

        if c > x {
            return a + fibonacci(x: x - b)
        } else if c == x {
            return b
        }

        a = b
        b = c
    }
}
```
