# iOS 앱개발 기초반 - 4 주차

### [수업 목표]
1. 라이브러리를 프로젝트에 포함하고 사용
2. API 서버와 데이터 통신
3. UITableView의 동적인(dynamic) 방법 사
4. UICollectionView 사용

## 01. 4 주차
1. import로 라이브러리 추가
2. API 서버와 통신
- API : 클라이언트가 서버에 데이터를 요청할 때 미리 정해져있는 방법
- GET 방식 : 서버에서 데이터를 가져오는 방법
- POST 방식 : 서버에 데이터를 보내는 방법
3. UITableView(dynamic) & UICollectionView
- UITableView(dynamic) : 사용자가 미리 지정한 섹션과 로우가 아닌, 서버에서 데이터를 받은 값대로 섹션과 로우 생성
- UICollectionView : 한 줄에 하나의 뷰가 들어가는 TableView와 다르게 한 줄에 여러 칸이 들어가는 뷰

## 02. 라이브러리 추가
**라이브러리 (Library)** <br>
- 다른 프로그래머들이 만들었던 코드들의 묶음
- 프레임워크, 패키리라고 불리기도 함

**라이브러리 추가 방법** <br>
1. cocoaPod : 중앙화된 저장소로 운영하는 방식
2. Carthage : 분산된 저장소를 지원하는 방식
3. Swift Package Manager : 별도의 프로그램 없이 Swift 에서 가장 쉽게 적용할 수 있는 방식

```
Swift Package Manager 사용하기

File → Swift Packages → Add Package Dependencies... → URL 입력

import 패키지명 작성
```

**라이브러리 사용한 경우**

```swift
import Alamofire
...
AF.request("https://api.thecatapi.com/v1/images/search").responseString { (resp) in
  print(resp.value ?? "")
}
```

**라이브러리 사용하지 않은 경우**

```swift
...
var request = URLRequest(url: URL(string: "https://api.thecatapi.com/v1/images/search")!)
var task = URLSession(configuration: .dafault).dataTask(with: request) { (data, response, error) in
  DispatchQueue.main.async {
    print(String(data: data!, encoding: .utf8) ?? "")
  }
}

task.resume()
```

## 03. API 서버와의 통신
**API** : 클라이언트가 서버에 데이터를 요청할 때 미리 정해져있는 방법 (서버 주고, 요청 방식, 응답 방식 등의 규칙 저장) <br>
**Almofire & SwiftyJSON** <br>
- Almofire : Swift로 쓰인 네트워크 라이브러리
- SwiftyJSON : 서버의 결과로 받은 JSON 데이터를 Swift에서 깔끔하게 사용할 수 있는 라이브러리
