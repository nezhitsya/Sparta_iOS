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
- 조건문
    Ex. 20 보다 작으면 청소년, 20 보다 크면 성인
    ```swift
    var age = 30

    if age > 20 {
      print("성인")
    } else {
      print("청소년")
    }
    ```

    - 조건이 여러 개일 경우 사용하는 if, else if, else
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

    - switch : if, else if, else 간편화
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
- 반복문
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

## 03. UI 컴포넌트와 조건문
