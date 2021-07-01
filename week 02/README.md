# iOS 앱개발 기초반 - 2 주차

### [수업 목표]
1. Swift 기본 문법 - 조건문, 반복문
2. 조건문, 반복문을 이용해 UI 컴포넌트 연습
    1) 버튼 (UIButton)으로 조건문 연습
    2) 텍스트 필트(UITextField)로 반복문 연습
3. Swift 심화 문법 - 옵셔널, 클래스, 구조체
4. 타이머 앱 만들기

## 01. 2 주차
- 조건문 : 어떤 조건을 만족하거나 만족하지 못 했을 때 무엇이 실행되어야 하는지 알려주는 코드
- 반복문 : 동일한 작업을 반복해서 해야할 때 사용하는 코드
- UI 컴포넌트들을 이용해서 조건문, 반복문 활용

## 02. Swift 기본 문법 - 조건문, 반복문
- 조건문 <br>
    Ex. 20 보다 작으면 청소년, 20 보다 크면 성인
    ```swift
    var age = 30

    if age > 20 {
      print("성인")
    } else {
      print("청소년")
    }
    ```

    - 조건이 여러 개일 경우 사용하는 if, else if, else <br>
    Ex.
    ```swift
    var fruit = "apple"

    if fruit == "apple" {
      print("apple JMT")
    } else if fruit == "grape" {
      print("grape JMT")
    } else if fruit == "pear" {
      print("pear JMT")
    } else {
      print("fruit JMT")
    }
    ```

    - switch : if, else if, else 간편화 <br>
    Ex.
    ```swift
    var fruit = "apple"

    switch fruit {
    case "apple" :
      print("apple JMT")
    case "grape" :
      print("grape JMT")
    case "pear" :
      print("pear JMT")
    default :
      print("fruit JMT")
    }
    ```
- 반복문 <br>
    Ex. 0부터 99까지 출력
    ```swift
    for i in 0..<100 {
      print(i)
    }
    ```
    Ex. 0부터 100까지 출력
    ```swift
    for i in 0...100 {
      print(i)
    }
    ```
    - 리스트
    ```swift
    var people = ["a", "b", "c", "d", "e"]

    for person in people {
      print(person)
    }
    ```
    ```swift
    var people = ["a", "b", "c", "d", "e"]

    for i in 0..<people.count {
      var person = people[i]
      print(person)
    }
    ```

## 03. [UI 컴포넌트와 조건문](https://github.com/nezhitsya/Sparta_iOS/blob/master/week%2002/SwiftPractice%2001/README.md)

<p align="center">
  <img width="300" src="https://user-images.githubusercontent.com/60697742/123884270-d6a5cd00-d985-11eb-8e96-0c2f1c2e586d.mov">
</p>

## 04. [UI 컴포넌트와 반복문](https://github.com/nezhitsya/Sparta_iOS/blob/master/week%2002/SwiftPractice%2002/README.md)

<p align="center">
  <img width="300" src="https://user-images.githubusercontent.com/60697742/123888270-18d30c80-d98e-11eb-9456-b9884dc90e63.mov">
</p>

## 05. [UIButton -> UISwitch](https://github.com/nezhitsya/Sparta_iOS/tree/master/week%2002/SwiftPractice%2003)

<p align="center">
  <img width="300" src="https://user-images.githubusercontent.com/60697742/124045596-f3580880-da4a-11eb-9aee-36cfe27dbd30.mov">
</p>

## 06. Swift 심화 문법 - 옵셔널

옵셔널
- '값이 채워져 있을 수도 있고, 비어 있을 수도 있다'라는 뜻
- 변수의 값이 비어있다면 'nil'이라고 표현 (다른 언어에서는 'null'로 표현)
- 어떤 변수가 비어 있을 수도 있다면 명시적으로 해당 변수가 'Optional'이라고 선언

```swift
var someValue: String? = "어떤 값"
someValue = nil

var anotherValue: String = "다른 값"
anotherValue = nil // error
```

```
옵셔널을 쓰는 이유

태초에 비어 있는 값이 없어 0과 같은 값을 비어 있는 값이라 약속
후에 자바에서 null이 도입되었지만, 해당 변수가 비어 있는지 확인하는 코드 작성 필요
Swift에서는 Optional이라는 개념을 도입해 값이 비어 있는지 확인할 필요가 없어짐
```

- 옵셔널 특징

```swift
// 옵셔널 체인 (Optional Chaining) : 한번 nil이면 그 뒤로 계속 nil
var someFruits = ["A", "B", "C", "D", "E"]
print(someFruits.first?.count)

someFruits = []
print(someFruits.first?.count) // nil

// 옵셔널 강제 해제 : 옵셔널인 변수를 nil이 아니라 확신시켜주는 !
var anotherFruits: String = someFruits.first!
print(anotherFruits) // A
```

- ! 자세히 알아보기

```swift
var value: Int = 3
var valueToBeSet: Int! = 4
var valueCanBeNil: Int? = 5

value = valueToBeSet // 가능 - ! (? 없는 변수와 ? 사이 ...)
value = valueCanBeNil // 불가능 - ? 이기 때문에
value = valueCanBeNil! // 가능 - ! 로 변경하였기 때문
```

- Optional과 Non-Optional 사이 어딘가
- !는 변수가 nil 일 확률이 매우 작은 경우에 사용
- 지금 당장은 값이 없지만 곧 값이 채워질 변수

## 07. Swift 심화 문법 - 클래스, 구조체

```
swift - 객체지향 프로그래밍 (OOP; Object-Oriented Programming) 언어

. 연산자
- a.b는 a의 하위 속성 b 언급
- a.c()는 a에게 c라는 함수 실행
```

- 구조체 (Struct)

```swift
// 타입 정의
struct Work {
  var task: String
  var hoursToDo: Int
}

var firstWork = Work(task: "study", hoursToDo: 3)
var secondWork = Work(task: "laundry", hoursToDo: 1)
```

- 클래스 (Class)

```swift
class Student {
    var name: String
    var house: String

    init(name: String, house: String) {
        self.name = name
        self.house = house
    }
}

var lee = Student(name: "leedayeong", house: "Seoul")
```

- 공통점

1. 구조체와 클래스 모두 내부에 변수(프로퍼티)를 가질 수 있고 . 연산자를 통해 접근

2. 구조체와 클래스 모두 내부에 함수(메소드)를 가질 수 있고 . 연산자를 통해 접근

- 차이점
    - 구조체
    1. init 함수(생성자)를 만들지 않아도 자동으로 생성
    2. 구조체를 대입하면 그 값을 복제 // 원본, 복사본 서로 다른 값 <br>
    ```swift
    struct Work {
        var task: String
        var hoursToDo: Int
    }

    //1. 구조체는 init 함수를 만들지 않아도 자동으로 만들어줍니다.
    var firstWork = Work(task: "강의자료 작성하기", hoursToDo: 3)
    var secondWork = Work(task: "분리수거 하기", hoursToDo: 1)

    //2. 구조체를 대입하면 그 '값'을 복제합니다.
    var firstWorkCopy = firstWork

    //3. 원본 구조체 변수에 접근해서 값을 변경해볼까요?
    firstWork.hoursToDo -= 1

    //원본과 복사본 둘이 서로 다른 값을 가지는군요?
    print(firstWork) //  Work(task: "강의자료 작성하기", hoursToDo: 2)
    print(firstWorkCopy) // Work(task: "강의자료 작성하기", hoursToDo: 3)
    ```

    - 클래스
    1. 클래스는 init 함수(생성자) 필수 생성
    2. 클래스에 대입 시 복제가 아닌 새롭게 생성 // 원본, 복사본 서로 같은 값
    ```swift
    class Student {
        var name: String
        var house: String

        init(name: String, house: String) {
            self.name = name
            self.house = house
        }

        func introduce() {
            print("\(house) 기숙사에 사는 \(name) 입니다")
        }
    }

    // 1. 클래스는 init 함수를 꼭 만들어 주어야 합니다.
    var joo = Student(name: "주정한", house: "슬리데린")

    // 2. 클래스를 대입하면 복제인간을 만드는 게 아니라 그냥 별명을 하나 새로 붙인다 정도
    var anotherJoo = joo
    joo.introduce() // 슬리데린 기숙사에 사는 주정한 입니다
    anotherJoo.introduce() // 슬리데린 기숙사에 사는 주정한 입니다

    joo.house = "레번클로" // 전학(?)
    joo.introduce() // 레번클로 기숙사에 사는 주정한 입니다
    anotherJoo.introduce() // 레번클로 기숙사에 사는 주정한 입니다
    ```
