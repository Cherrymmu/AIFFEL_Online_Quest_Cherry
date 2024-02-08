import 'package:flutter/material.dart';
import 'two_screen.dart';

class OneScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: Text('First Page'),
        leading: ElevatedButton(
          onPressed: () { // 아이콘 클릭 시 "고양이 좋아" 가 출력되는 기능 추가
            print("고양이 좋아");
          },
          style: ElevatedButton.styleFrom( // 아이콘 생성
            shape: CircleBorder(),
            padding: EdgeInsets.all(10),
            primary: Colors.deepPurpleAccent,
          ),
          child: Icon(Icons.favorite, color: Colors.white),
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
                onPressed: () async {
                  print("is_cat");
                  // Navigator.push 함수로 다른 화면으로의 탐색 시작.
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TwoScreen()),
                  );
                },
                child: Text(
                  "NEXT",
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
                      "https://i.pinimg.com/474x/e3/df/e4/e3dfe45a4651b00e425785972053feaf.jpg",
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
