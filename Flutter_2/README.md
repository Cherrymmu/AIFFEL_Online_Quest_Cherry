# AIFFEL Campus Online Code Peer Review Templete
- 코더 : 김승순, 홍채림
- 리뷰어 : 이선재


# PRT(Peer Review Template)
- [X]  **1. 주어진 문제를 해결하는 완성된 코드가 제출되었나요?**
    - 문제에서 요구하는 최종 결과물이 첨부되었는지 확인
    - 문제를 해결하는 완성된 코드란 프로젝트 루브릭 3개 중 2개, 
    퀘스트 문제 요구조건 등을 지칭
        - 해당 조건을 만족하는 코드를 캡쳐해 근거로 첨부
```
    leading: ElevatedButton(
            onPressed: () {
              print("하트"); // 버튼이 눌렸을 때 콘솔에 "하트" 출력
            },
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(), // 원형 버튼 모양을 설정합니다.
              padding: EdgeInsets.all(10), // 패딩을 설정합니다.
              primary: Colors.indigo, // 버튼 배경색을 인디고색으로 설정합니다.
            ),
            child: Icon(
              Icons.favorite, // 아이콘을 하트 모양으로 설정합니다.
              color: Colors.white, // 아이콘 색상을 흰색으로 설정합니다.
            ),
          ),
```
[리뷰] 좌측에 아이콘을 만들고, 아이콘을 클릭했을 때의 동작까지 지정하였다.  

```
    title: Text('플러터 앱 만들기'),
```
[리뷰] 앱바의 타이틀로 '플러터 앱 만들기' 문구가 정상적으로 출력되었다.  

```
    child: Text(
                "Text",
                style: TextStyle(
                  fontSize: 32, // 텍스트 사이즈를 32로 설정하여 크게 만듭니다.
                ),
              ),
```
[리뷰] Text라고 표시된 버튼이 중앙에 정렬되어 생성되었다.  

```
    onPressed: () {
                print("버튼이 눌렸습니다"); // 버튼 클릭 시 콘솔에 메시지 출력합니다.
              },
```
[리뷰] 버튼을 클릭했을 때, 로그에 '버튼이 눌렸습니다.' 문구가 출력되는 것을 확인할 수 있었다.  

```
    child: Stack(
                  alignment: Alignment.topLeft, // Stack의 자식 위젯들을 왼쪽 상단으로 정렬합니다.
                  children: List.generate(5, (index) {
                    return Container(
                      width: 300.0 - index * 60.0, // 컨테이너의 너비를 설정합니다.
                      height: 300.0 - index * 60.0, // 컨테이너의 높이를 설정합니다.
                      decoration: BoxDecoration(
                        color: Colors.indigo[100 * (index + 1)], // 컨테이너의 색상을 설정합니다.
                        border: Border.all(
                          color: Colors.indigo[900]!, // 테두리의 색상을 설정합니다.
                          width: 3, // 테두리의 두께를 설정합니다.
                        ),
                      ),
                    );
                  }),
```
[리뷰] Stack을 사용하여 정해진 규격만큼 작아지는 사각형을 표현한 것을 확인할 수 있었다.  
---
    
- [X]  **2. 전체 코드에서 가장 핵심적이거나 가장 복잡하고 이해하기 어려운 부분에 작성된 
주석 또는 doc string을 보고 해당 코드가 잘 이해되었나요?**
    - 해당 코드 블럭에 doc string/annotation이 달려 있는지 확인
    - 해당 코드가 무슨 기능을 하는지, 왜 그렇게 짜여진건지, 작동 메커니즘이 뭔지 기술.
    - 주석을 보고 코드 이해가 잘 되었는지 확인
        - 잘 작성되었다고 생각되는 부분을 캡쳐해 근거로 첨부합니다.
     
```
    Expanded(
              child: Align(
                alignment: FractionalOffset.center, // 자식 위젯을 중앙으로 정렬합니다.
                child: Stack(
                  alignment: Alignment.topLeft, // Stack의 자식 위젯들을 왼쪽 상단으로 정렬합니다.
                  children: List.generate(5, (index) {
                    return Container(
                      width: 300.0 - index * 60.0, // 컨테이너의 너비를 설정합니다.
                      height: 300.0 - index * 60.0, // 컨테이너의 높이를 설정합니다.
                      decoration: BoxDecoration(
                        color: Colors.indigo[100 * (index + 1)], // 컨테이너의 색상을 설정합니다.
                        border: Border.all(
                          color: Colors.indigo[900]!, // 테두리의 색상을 설정합니다.
                          width: 3, // 테두리의 두께를 설정합니다.
                        ),
                      ),
                    );
                  }),
                ),
              ),
```
[리뷰] 줄어드는 사각형을 구현한 코드에 대한 주석이 자세하게 작성되어 있다.  

---

        
- [X]  **3. 에러가 난 부분을 디버깅하여 문제를 “해결한 기록을 남겼거나” 
”새로운 시도 또는 추가 실험을 수행”해봤나요?**
    - 문제 원인 및 해결 과정을 잘 기록하였는지 확인
    - 문제에서 요구하는 조건에 더해 추가적으로 수행한 나만의 시도, 
    실험이 기록되어 있는지 확인
        - 잘 작성되었다고 생각되는 부분을 캡쳐해 근거로 첨부합니다.
     
```
              leading: ElevatedButton(
            onPressed: () {
              print("하트"); // 버튼이 눌렸을 때 콘솔에 "하트" 출력
            },
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(), // 원형 버튼 모양을 설정합니다.
              padding: EdgeInsets.all(10), // 패딩을 설정합니다.
              primary: Colors.indigo, // 버튼 배경색을 인디고색으로 설정합니다.
            ),
            child: Icon(
              Icons.favorite, // 아이콘을 하트 모양으로 설정합니다.
              color: Colors.white, // 아이콘 색상을 흰색으로 설정합니다.
            ),
          ),
        ),
```
[리뷰] 기존의 학습에서 사용한 이미지가 아닌, 새로운 이미지와 그에 대한 이벤트를 추가하였다.  

        
- [X]  **4. 회고를 잘 작성했나요?**
    - 주어진 문제를 해결하는 완성된 코드 내지 프로젝트 결과물에 대해
    배운점과 아쉬운점, 느낀점 등이 기록되어 있는지 확인
    - 전체 코드 실행 플로우를 그래프로 그려서 이해를 돕고 있는지 확인
        - 잘 작성되었다고 생각되는 부분을 캡쳐해 근거로 첨부합니다.
     
```
    /*
김승순 회고

KEEP
- 전반적인 학습 내용응 응용해서 가이드에 따라서 차근 차근 적용했다.
- 구현 과정을 이해하기 위해 최대한 주석을 자세하게 작성했다.

PROBLEM
- 각각의 기능은 알고 있는데, 이것을 연결하는 것이 어려운것 같다.
TRY
- 각각의 구조를 머리속으로 그리고 연결하기 위한 괄호들을 잘 연결하게 구성을 파악하는 연습이 필요하다.
- 결국은 많으 실만많이 답!

홍채림 회고

KEEP
- 컬러 적용하는 것을 잘 공부두길 잘한 것 같다. 
PROBLEM
- 구조의 흐름은 만들어둔 것을 읽는 것은 괜찮지만, 직접 구현을 하는 것은 좀 어렵다. 
TRY
- 구조를 좀 더 자세하게 확실히 알기 위해서 책을 좀 더 읽어봐야겠다. 그리고 코드를 열심히 필사해봐야겠다. 


*/
```
[리뷰] 각 코더 그루님들의 회고가 잘 작성되어 있다.  

---

        
- [X]  **5. 코드가 간결하고 효율적인가요?**
    - 파이썬 스타일 가이드 (PEP8) 를 준수하였는지 확인
    - 하드코딩을 하지않고 함수화, 모듈화가 가능한 부분은 함수를 만들거나 클래스로 짰는지
    - 코드 중복을 최소화하고 범용적으로 사용할 수 있도록 함수화했는지
        - 잘 작성되었다고 생각되는 부분을 캡쳐해 근거로 첨부합니다.
     
```
    Container(
                      width: 300.0 - index * 60.0, // 컨테이너의 너비를 설정합니다.
                      height: 300.0 - index * 60.0, // 컨테이너의 높이를 설정합니다.
                      decoration: BoxDecoration(
                        color: Colors.indigo[100 * (index + 1)], // 컨테이너의 색상을 설정합니다.
                        border: Border.all(
                          color: Colors.indigo[900]!, // 테두리의 색상을 설정합니다.
                          width: 3, // 테두리의 두께를 설정합니다.
```
[리뷰] 인덱스 처리하여 불필요한 코드를 간소화시켰다.  
---

<img width="273" alt="스크린샷 2024-02-06 오후 4 15 31" src="https://github.com/Cherrymmu/AIFFEL_Online_Quest_Cherry/assets/149548944/567d1c04-6a22-4062-a08d-6a89f325c59e">
<img width="777" alt="스크린샷 2024-02-06 오후 4 58 28" src="https://github.com/Cherrymmu/AIFFEL_Online_Quest_Cherry/assets/149548944/6dd06b65-7cd0-48e4-8c05-66ca03e1b080">


# 참고 링크 및 코드 개선
```
# 코드 리뷰 시 참고한 링크가 있다면 링크와 간략한 설명을 첨부합니다.
# 코드 리뷰를 통해 개선한 코드가 있다면 코드와 간략한 설명을 첨부합니다.
```
