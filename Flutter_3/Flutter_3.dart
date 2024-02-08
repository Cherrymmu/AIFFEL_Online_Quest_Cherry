// // 파일 명
// main.dart
// one_screen.dart
// two_screen.dart
// user.dart

// // main.dart
// import 'package:flutter/material.dart';
// import 'one_screen.dart';
// import 'two_screen.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       initialRoute: '/one',
//       routes: {
//         '/one' : (context) => OneScreen(),
//         '/two' : (context) => TwoScreen(),
//       },
//     );
//   }
// }

// // one_screen
// class OneScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.indigoAccent,
//         title: Text('First Page'),
//         leading: ElevatedButton(
//           onPressed: () {
//             print("고양이 좋아");
//           },
//           style: ElevatedButton.styleFrom(
//             shape: CircleBorder(),
//             padding: EdgeInsets.all(10),
//             primary: Colors.deepPurpleAccent,
//           ),
//           child: Icon(Icons.favorite, color: Colors.white),
//         ),
//       ),
//       body: Container(
//         color: Colors.white,
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SizedBox(height: 48),
//               ElevatedButton(
//                 onPressed: () async {
//                   print("is_cat");
//                   final result = await Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => TwoScreen()),
//                   );
//                 },
//                 child: Text(
//                   "NEXT",
//                   style: TextStyle(fontSize: 32),
//                 ),
//                 style: ElevatedButton.styleFrom(
//                   fixedSize: Size(200, 100),
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
//                 ),
//               ),
//               Expanded(
//                 child: Align(
//                   alignment: FractionalOffset.center,
//                   child: Container(
//                     width: 300, // Container의 너비를 300으로 설정
//                     height: 300, // Container의 높이를 300으로 설정
//                     child: Image.network(
//                       "https://i.pinimg.com/474x/e3/df/e4/e3dfe45a4651b00e425785972053feaf.jpg",
//                       fit: BoxFit.cover, // 이미지가 Container의 크기에 맞게 조절되도록 설정
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


// // two_screen : dog page
// import 'package:flutter/material.dart';
// import 'user.dart';

// class TwoScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     Map<String, Object> args = ModalRoute.of(context)?.settings.arguments as Map<String, Object>;

//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           leading: Icon(Icons.dog),
//           title: Text('Second Page'),
//         ),
//         body: Container(
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.pop(context); // Navigator.pop() 함수 : 이전 화면으로 돌아가는 기능
//                   },
//                   child: Text('Back'),
//                 ),
//                 Image(image: NetworkImage(
//                   'http://image.dongascience.com/Photo/2020/03/5bddba7b6574b95d37b6079c199d7101.jpg'
//                 ),
//                 width: 300,
//                 height: 300,),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }



// // two_screen 수정

// import 'package:flutter/material.dart';

// class TwoScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.indigoAccent,
//         title: Text('Second Page'),
//         leading: ElevatedButton(
//           onPressed: () {
//             print("강아지 좋아");
//           },
//           style: ElevatedButton.styleFrom(
//             shape: CircleBorder(),
//             padding: EdgeInsets.all(10),
//             primary: Colors.deepPurpleAccent,
//           ),
//           child: Icon(Icons.favorite, color: Colors.white),
//         ),
//       ),
//       body: Container(
//         color: Colors.white,
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SizedBox(height: 48),
//               ElevatedButton(
//                 onPressed: () async {
//                   print("is_dog");
//                   Navigator.pop(context);
//                 },
//                 child: Text(
//                   "Back",
//                   style: TextStyle(fontSize: 32),
//                 ),
//                 style: ElevatedButton.styleFrom(
//                   fixedSize: Size(200, 100),
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
//                 ),
//               ),
//               Expanded(
//                 child: Align(
//                   alignment: FractionalOffset.center,
//                   child: Image.network(
//                     "https://i.pinimg.com/474x/dd/bb/25/ddbb25eece2214429c71bd97b5600623.jpg",
//                     width: 300,
//                     height: 300,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


/*
---
*/

/*

// import 'package:flutter/material.dart';

// // StatefulWidget으로 변경
// class OneScreen extends StatefulWidget {
//   @override
//   _OneScreenState createState() => _OneScreenState();
// }

// class _OneScreenState extends State<OneScreen> {
//   bool is_cat = true; // is_cat 변수 추가 및 초기값 true 설정

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.indigoAccent,
//         title: Text('First Page'),
//         leading: ElevatedButton(
//           onPressed: () {
//             // 상태 변경에 따라 setState를 호출하여 UI를 업데이트
//             setState(() {
//               print("고양이 좋아");
//               is_cat = !is_cat; // is_cat의 값을 토글
//             });
//           },
//           style: ElevatedButton.styleFrom(
//             shape: CircleBorder(),
//             padding: EdgeInsets.all(10),
//             primary: Colors.deepPurpleAccent,
//           ),
//           child: Icon(Icons.favorite, color: Colors.white),
//         ),
//       ),
//       body: Container(
//         color: Colors.white,
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SizedBox(height: 48),
//               ElevatedButton(
//                 onPressed: () async {
//                   print(is_cat ? "is_cat: true" : "is_cat: false");
//                   final result = await Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => TwoScreen()),
//                   );
//                 },
//                 child: Text(
//                   "NEXT",
//                   style: TextStyle(fontSize: 32),
//                 ),
//                 style: ElevatedButton.styleFrom(
//                   fixedSize: Size(200, 100),
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
//                 ),
//               ),
//               // 여기에 is_cat 변수 값에 따라 다른 위젯을 보여주는 코드를 추가할 수 있습니다.
//               Expanded(
//                 child: Align(
//                   alignment: FractionalOffset.center,
//                   child: Container(
//                     width: 300,
//                     height: 300,
//                     child: Image.network(
//                       "https://i.pinimg.com/474x/e3/df/e4/e3dfe45a4651b00e425785972053feaf.jpg",
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

class TwoScreen extends StatelessWidget {
  final bool isCat; // is_cat 변수를 TwoScreen 생성자를 통해 받습니다.

  // 생성자에 isCat 파라미터를 추가합니다.
  TwoScreen({required this.isCat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: Text('Second Page'),
        leading: ElevatedButton(
          onPressed: () {
            print("강아지 좋아");
          },
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            padding: EdgeInsets.all(10),
            primary: Colors.deepPurpleAccent,
          ),
          // Icons.pets 아이콘을 사용하여 강아지를 상징합니다.
          child: Icon(Icons.pets, color: Colors.white),
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
                onPressed: () {
                  // DEBUG CONSOLE에 is_cat의 현재 상태를 출력합니다.
                  print("is_cat: $isCat");
                  // 이전 화면으로 돌아가기. 스택에서 현재 페이지를 삭제합니다.
                  Navigator.pop(context);
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

---
*/




// 최종 제출용

// main
import 'package:flutter/material.dart';
import 'one_screen.dart';
import 'two_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/one',
      routes: {
        '/one' : (context) => OneScreen(),
        '/two' : (context) => TwoScreen(),
      },
    );
  }
}


// one_screen
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


// two_screen - 제출용
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




/* 회고

홍채림
- KEEP
: 여러가지 새로운 포인트를 시도해 본 것(아이콘을 엘리베이트 버튼으로 만들기, 색상을 원하는 색상으로 넣기등)
- PROBLEM
:첫시도에 이미지를 컨테이너에 넣지 않아서 사이즈 조절이 어려웠다.
- TRY
: 아이콘을 클릭할떄 고양이 페이지에 "고양이 좋아가 출력되도록 한 것"

김양희
- KEEP
문제에서 요구하는 바가 무엇인지 배운 내용에서 찾아서 적용해보았다.

- PROBLEM
아직 화면 구성이 익숙하지가 않아서 응용하는 데에 시간이 걸린다.
is_cat 변수의 의미와 코드 적용이 아직 이해가 되지 않았다.

- TRY
퀘스트 한 내용을 복습하고, 여러가지 구성을 만드는 연습해보기.


*/