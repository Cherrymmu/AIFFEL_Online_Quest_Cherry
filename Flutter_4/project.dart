// =======================================================================================

/*
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String result = "";
  TextEditingController urlController =
      TextEditingController(); // URL을 입력 받는 컨트롤러

  Future<void> fetchData() async {
    try {
      final enteredUrl = urlController.text; // 입력된 URL 가져오기
      final response = await http.get(
        Uri.parse(enteredUrl + "sample"), // 입력된 URL 사용
        headers: {
          'Content-Type': 'application/json',
          'ngrok-skip-browser-warning': '69420',
        },
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          result =
              "predicted_label: ${data['predicted_label']}\nprediction_score: ${data['prediction_score']}";
        });
      } else {
        setState(() {
          result = "Failed to fetch data. Status Code: ${response.statusCode}";
        });
      }
    } catch (e) {
      setState(() {
        result = "Error: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jellyfish Classifier"),
        centerTitle: true,
        leading: Icon(Icons.favorite, size: 40),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: urlController, // URL 입력을 위한 TextField
              decoration: InputDecoration(labelText: "URL 입력"), // 입력 필드의 라벨
            ),
            ElevatedButton(
              onPressed: fetchData,
              child: Text("데이터 가져오기"),
            ),
            SizedBox(height: 20),
            Text(
              result,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
*/

//=================================================================

/*

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String result = "";
  TextEditingController urlController = TextEditingController();

  Future<void> fetchData(String endpoint) async {
    try {
      final response = await http.get(
        Uri.parse(urlController.text + endpoint),
        headers: {
          'Content-Type': 'application/json',
          'ngrok-skip-browser-warning': '69420',
        },
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          result =
          "predicted_label: ${data['predicted_label']}\nprediction_score: ${data['prediction_score']}";
        });
      } else {
        setState(() {
          result = "Failed to fetch data. Status Code: ${response.statusCode}";
        });
      }
    } catch (e) {
      setState(() {
        result = "Error: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jellyfish Classifier"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: urlController,
              decoration: InputDecoration(labelText: "URL 입력"),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => fetchData("/result"), // 예측 결과를 가져오는 URL
                  child: Text("예측 결과 버튼"),
                ),
                ElevatedButton(
                  onPressed: () => fetchData("/score"), // 예측 확률을 가져오는 URL
                  child: Text("예측 확률 버튼"),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              result,
              style: TextStyle(fontSize: 18),
            ),
            // 결과 표시
            Text(
              result,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            // 이미지를 표시할 컨테이너
            SizedBox(height: 20),
            Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent),
              ),
              child: Container(
                width: 300, // Container의 너비를 300으로 설정
                height: 300, // Container의 높이를 300으로 설정
                  child: Image.network(
                  "https://kienthuckhoahoc.org/images/kt/16/0/ly5.jpg", // 이미지 URL
                  fit: BoxFit.cover,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
*/

// =======================================================================================

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   String result = "";
//   TextEditingController urlController = TextEditingController();

//   Future<void> fetchData(String endpoint) async {
//     try {
//       final response = await http.get(
//         Uri.parse(urlController.text + endpoint),
//         headers: {
//           'Content-Type': 'application/json',
//           'ngrok-skip-browser-warning': '69420',
//         },
//       );
//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         setState(() {
//           result =
//           "predicted_label: ${data['predicted_label']}\nprediction_score: ${data['prediction_score']}";
//         });
//       } else {
//         setState(() {
//           result = "Failed to fetch data. Status Code: ${response.statusCode}";
//         });
//       }
//     } catch (e) {
//       setState(() {
//         result = "Error: $e";
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Jellyfish Classifier"),
//         centerTitle: true,
//         leading: Icon(Icons.favorite, size: 40),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: <Widget>[
//             SizedBox(height: 20),
//             Text(
//               result,
//               style: TextStyle(fontSize: 18),
//             ),
//             // 결과 표시
//             Text(
//               result,
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 18),
//             ),
//             // 이미지를 표시할 컨테이너
//             SizedBox(height: 20),
//             Container(
//               width: 300,
//               height: 300,
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.blueAccent),
//               ),
//               child: Container(
//                 width: 300, // Container의 너비를 300으로 설정
//                 height: 300, // Container의 높이를 300으로 설정
//                 child: Image.network(
//                   "https://kienthuckhoahoc.org/images/kt/16/0/ly5.jpg", // 이미지 URL
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             SizedBox(height: 80),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton(
//                   onPressed: () => fetchData("/result"), // 예측 결과를 가져오는 URL
//                   child: Text("예측 결과 버튼"),
//                 ),
//                 ElevatedButton(
//                   onPressed: () => fetchData("/score"), // 예측 확률을 가져오는 URL
//                   child: Text("예측 확률 버튼"),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// ==========================================================================

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.indigo, // AppBar 배경색을 인디고색으로 설정합니다.
//           title: Text('플러터 앱 만들기'), // AppBar 중앙 텍스트
//           leading: ElevatedButton(
//             onPressed: () {
//               print("하트"); // 버튼이 눌렸을 때 콘솔에 "하트" 출력
//             },
//             style: ElevatedButton.styleFrom(
//               shape: CircleBorder(), // 원형 버튼 모양을 설정합니다.
//               padding: EdgeInsets.all(10), // 패딩을 설정합니다.
//               primary: Colors.indigo, // 버튼 배경색을 인디고색으로 설정합니다.
//             ),
//             child: Icon(
//               Icons.favorite, // 아이콘을 하트 모양으로 설정합니다.
//               color: Colors.white, // 아이콘 색상을 흰색으로 설정합니다.
//             ),
//           ),
//         ),
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.center, // Column의 세로 정렬을 중앙으로 설정합니다.
//           children: [
//             SizedBox(height: 48), // AppBar와 버튼 사이의 공간을 추가합니다.
//             ElevatedButton(
//               onPressed: () {
//                 print("버튼이 눌렸습니다"); // 버튼 클릭 시 콘솔에 메시지 출력합니다.
//               },
//               child: Text(
//                 "Text",
//                 style: TextStyle(
//                   fontSize: 32, // 텍스트 사이즈를 32로 설정하여 크게 만듭니다.
//                 ),
//               ),
//               style: ElevatedButton.styleFrom(
//                 fixedSize: Size(200, 100), // 버튼의 가로 200, 세로 100 사이즈로 설정합니다.
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(0), // 모서리 둥글기를 0으로 설정해 모서리가 둥글지 않게 설정합니다.
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Align(
//                 alignment: FractionalOffset.center, // 자식 위젯을 중앙으로 정렬합니다.
//                 child: Stack(
//                   alignment: Alignment.topLeft, // Stack의 자식 위젯들을 왼쪽 상단으로 정렬합니다.
//                   children: List.generate(5, (index) {
//                     return Container(
//                       width: 300.0 - index * 60.0, // 컨테이너의 너비를 설정합니다.
//                       height: 300.0 - index * 60.0, // 컨테이너의 높이를 설정합니다.
//                       decoration: BoxDecoration(
//                         color: Colors.indigo[100 * (index + 1)], // 컨테이너의 색상을 설정합니다.
//                         border: Border.all(
//                           color: Colors.indigo[900]!, // 테두리의 색상을 설정합니다.
//                           width: 3, // 테두리의 두께를 설정합니다.
//                         ),
//                       ),
//                     );
//                   }),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//======================================================================

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   String result = "";
//   TextEditingController urlController = TextEditingController();

//   Future<void> prediction_label(String url) async {
//     try {
//       final response = await http.get(
//         Uri.parse(urlController.text + url),
//         headers: {
//           'Content-Type': 'application/json',
//           'ngrok-skip-browser-warning': '69420',
//         },
//       );
//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         setState(() {
//           result =
//           "predicted_label: ${data['predicted_label']}";
//         });
//       } else {
//         setState(() {
//           result = "Failed to fetch data. Status Code: ${response.statusCode}";
//         });
//       }
//     } catch (e) {
//       setState(() {
//         result = "Error: $e";
//       });
//     }
//   }

//   Future<void> prediction_score(String url) async {
//     try {
//       final response = await http.get(
//         Uri.parse(urlController.text + url),
//         headers: {
//           'Content-Type': 'application/json',
//           'ngrok-skip-browser-warning': '69420',
//         },
//       );
//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         setState(() {
//           result =
//           "prediction_score: ${data['prediction_score']}";
//         });
//       } else {
//         setState(() {
//           result = "Failed to fetch data. Status Code: ${response.statusCode}";
//         });
//       }
//     } catch (e) {
//       setState(() {
//         result = "Error: $e";
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Jellyfish Classifier"),
//         centerTitle: true,
//         leading: Icon(Icons.favorite, size: 40),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: <Widget>[
//             SizedBox(height: 20),
//             Text(
//               result,
//               style: TextStyle(fontSize: 18),
//             ),
//             // 결과 표시
//             Text(
//               result,
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 18),
//             ),
//             // 이미지를 표시할 컨테이너
//             SizedBox(height: 20),
//             Container(
//               width: 300,
//               height: 300,
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.blueAccent),
//               ),
//               child: Container(
//                 width: 300, // Container의 너비를 300으로 설정
//                 height: 300, // Container의 높이를 300으로 설정
//                 child: Image.network(
//                   "https://kienthuckhoahoc.org/images/kt/16/0/ly5.jpg", // 이미지 URL
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             SizedBox(height: 80),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton(
//                   onPressed: () => prediction_label("https://121a-34-82-207-198.ngrok-free.app/sample"), // 예측 결과를 가져오는 URL
//                   child: Text("예측 결과 버튼"),
//                 ),
//                 ElevatedButton(
//                   onPressed: () => prediction_score("https://121a-34-82-207-198.ngrok-free.app/sample"), // 예측 확률을 가져오는 URL
//                   child: Text("예측 확률 버튼"),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//==========================================================================

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   String result = "";
//   TextEditingController urlController = TextEditingController();

//   Future<void> prediction_label(String url) async {
//     try {
//       final response = await http.get(
//         Uri.parse(urlController.text + url),
//         headers: {
//           'Content-Type': 'application/json',
//           'ngrok-skip-browser-warning': '69420',
//         },
//       );
//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         setState(() {
//           result =
//           "predicted_label: ${data['predicted_label']}";
//         });
// ㅜ
//       } else {
//         setState(() {
//           result = "Failed to fetch data. Status Code: ${response.statusCode}";
//         });
//       }
//     } catch (e) {
//       setState(() {
//         result = "Error: $e";
//       });
//     }
//   }

//   Future<void> prediction_score(String url) async {
//     try {
//       final response = await http.get(
//         Uri.parse(urlController.text + url),
//         headers: {
//           'Content-Type': 'application/json',
//           'ngrok-skip-browser-warning': '69420',
//         },
//       );
//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         setState(() {
//           result =
//           "prediction_score: ${data['prediction_score']}";
//         });
//       } else {
//         setState(() {
//           result = "Failed to fetch data. Status Code: ${response.statusCode}";
//         });
//       }
//     } catch (e) {
//       setState(() {
//         result = "Error: $e";
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Jellyfish Classifier"),
//         centerTitle: true,
//         leading: Icon(Icons.favorite, size: 40),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: <Widget>[
//             SizedBox(height: 20),
//             // 결과 표시
//             Text(
//               result,
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 18),
//             ),
//             // 이미지를 표시할 컨테이너
//             SizedBox(height: 20),
//             Container(
//               width: 300,
//               height: 300,
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.blueAccent),
//               ),
//               child: Container(
//                 width: 300, // Container의 너비를 300으로 설정
//                 height: 300, // Container의 높이를 300으로 설정
//                 child: Image.network(
//                   "https://kienthuckhoahoc.org/images/kt/16/0/ly5.jpg", // 이미지 URL
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             SizedBox(height: 80),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton(
//                   onPressed: () => prediction_label('https://f1a7-35-197-41-111.ngrok-free.app/sample'), // 예측 결과를 가져오는 URL
//                   child: Text("예측 결과 버튼"),
//                 ),
//                 ElevatedButton(
//                   onPressed: () => prediction_score('https://f1a7-35-197-41-111.ngrok-free.app/sample'), // 예측 확률을 가져오는 URL
//                   child: Text("예측 확률 버튼"),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//=============================================================================

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String result = "";
  TextEditingController urlController = TextEditingController();

  Future<void> prediction_label(String url) async {
    try {
      final response = await http.get(
        Uri.parse(urlController.text + url),
        headers: {
          'Content-Type': 'application/json',
          'ngrok-skip-browser-warning': '69420',
        },
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          result = "predicted_label: ${data['predicted_label']}";
        });
        print(result);
      } else {
        setState(() {
          result = "Failed to fetch data. Status Code: ${response.statusCode}";
        });
      }
    } catch (e) {
      setState(() {
        result = "Error: $e";
      });
    }
  }

  Future<void> prediction_score(String url) async {
    try {
      final response = await http.get(
        Uri.parse(urlController.text + url),
        headers: {
          'Content-Type': 'application/json',
          'ngrok-skip-browser-warning': '69420',
        },
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          result = "prediction_score: ${data['prediction_score']}";
        });
        print(result);
      } else {
        setState(() {
          result = "Failed to fetch data. Status Code: ${response.statusCode}";
        });
      }
    } catch (e) {
      setState(() {
        result = "Error: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jellyfish Classifier"),
        centerTitle: true,
        leading: Icon(Icons.favorite, size: 40),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20),
            // 결과 표시
            Text(
              result,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            // 이미지를 표시할 컨테이너
            SizedBox(height: 20),
            Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent),
              ),
              child: Container(
                width: 300, // Container의 너비를 300으로 설정
                height: 300, // Container의 높이를 300으로 설정
                child: Image.network(
                  "https://kienthuckhoahoc.org/images/kt/16/0/ly5.jpg", // 이미지 URL
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 80),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => prediction_label(
                      'https://f1a7-35-197-41-111.ngrok-free.app/sample'), // 예측 결과를 가져오는 URL
                  child: Text("예측 결과 버튼"),
                ),
                ElevatedButton(
                  onPressed: () => prediction_score(
                      'https://f1a7-35-197-41-111.ngrok-free.app/sample'), // 예측 확률을 가져오는 URL
                  child: Text("예측 확률 버튼"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/*
이승환 회고

KEEP: 채림님과 포기하지 않고 서로 의논하며 결과를 도출한 것.

PROBLEM: 노션에서 설명하는 API 설정 할 때 처음이라 많이 버벅였으며
         시간을 과제 종료 시간 때까지 사용하여 제출물이 나오질 않았다.


TRY: API를 익숙하게 다룰 수 있게 연습을 해야하며 다양한 코드들을 참고하여
     시간 내에 할 수 있게 해야겠다.


홍채림 회고

KEEP: 끝까지 포기하지 않고 결과 값을 도출한 것

PROBLEM: 초반에 어떻게 해야하는지 갈피를 못잡았다.
          많이 헤매인 것을 위에 주석에서 확인할 수 있다. 
          특히 fastapi 사용이 미숙해서 너무 어려웠는데, 
          그 부분이 승환님과 이야기하면서 잘풀리게 되었다. 

TRY: fastapi 사용을 익숙하게해서 앱 디벨롭에 기여해야겠다. 
      생각보다 base 모델 연결이 잘되어서 결과가 잘나왔다. 

*/

