import 'package:flutter/material.dart';

class TwoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: Text('Second Page'),
        leading: ElevatedButton( // 아이콘 클릭 시 "강아지 좋아" 가 출력되는 기능 추가
          onPressed: () {
            print("강아지 좋아");
          },
          style: ElevatedButton.styleFrom(  // 아이콘 생성
            shape: CircleBorder(),
            padding: EdgeInsets.all(10),
            primary: Colors.deepPurpleAccent,
          ),
          child: Icon(Icons.mood, color: Colors.white),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 48),
              ElevatedButton(
                onPressed: () async {  // DEBUG CONSOLE에 출력되게 하기
                  print("is_dog");
                  Navigator.pop(context);  // 이전 화면으로 돌아가기. stack 제거됨.
                },
                child: Text(
                  "Back",
                  style: TextStyle(fontSize: 32),
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(200, 100),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: FractionalOffset.center,
                  child: Container(
                    width: 300, // Container의 너비를 300으로 설정
                    height: 300, // Container의 높이를 300으로 설정
                    child: Image.network(
                      "http://image.dongascience.com/Photo/2020/03/5bddba7b6574b95d37b6079c199d7101.jpg",
                      fit: BoxFit.cover, // 이미지가 Container의 크기에 맞게 조절되도록 설정
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
