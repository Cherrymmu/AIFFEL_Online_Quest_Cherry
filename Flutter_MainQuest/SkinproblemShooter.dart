import 'dart:async';
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
      // 초기 경로를 '/'로 설정
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(), // 초기 화면으로 HomeScreen을 설정
        '/one': (context) => OneScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/result') {
          final args = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (context) => ResultScreen(
              predictionLabel: args['predictionLabel'],
              predictionScore: args['predictionScore'],
            ),
          );
        }
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SkinproblemShooter"),
        backgroundColor: Colors.indigoAccent,
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("START"),
          onPressed: () {
            Navigator.pushNamed(context, '/one');
          },
        ),
      ),
    );
  }
}

class OneScreen extends StatefulWidget {
  @override
  _OneScreenState createState() => _OneScreenState();
}

class _OneScreenState extends State<OneScreen> {
  String result = "";
  String predictionLabel = "";
  String predictionScore = "";
  bool isLoading = false;
  TextEditingController urlController = TextEditingController();

  Future<void> prediction(String url) async {
    setState(() {
      isLoading = true;
    });

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
          predictionLabel = data['predicted_label'];
          predictionScore = (data['prediction_score'] * 100).toStringAsFixed(2);
          isLoading = false;
          result = "Label: $predictionLabel, Score: $predictionScore";
        });

        print(result); // 여기에서 결과를 출력합니다.

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultScreen(
              predictionLabel: predictionLabel,
              predictionScore: predictionScore,
            ),
          ),
        );
      } else {
        setState(() {
          result = "Failed to fetch data. Status Code: ${response.statusCode}";
          isLoading = false;
        });
        print(result); // 에러 메시지를 출력합니다.
      }
    } catch (e) {
      setState(() {
        result = "Error: $e";
        isLoading = false;
      });
      print(result); // 예외 발생 시 오류 메시지를 출력합니다.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SkinproblemShooter"),
        backgroundColor: Colors.indigoAccent,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 48),
            if (isLoading)
              Expanded(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            if (!isLoading)
              Container(
                width: 300,
                height: 300,
                child: Image.network(
                  "https://ioncosmetic.com/wp-content/uploads/2022/12/%EC%95%84%ED%86%A0%ED%94%BC-%ED%94%BC%EB%B6%80%EC%97%BC-%EC%9B%90%EC%9D%B8-%EC%A6%9D%EC%83%81-%EC%B9%98%EB%A3%8C-%EA%B4%80%EB%A6%AC.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            SizedBox(height: 20),
            // 결과 표시
            Text(
              result,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 48),
            if (!isLoading)
              ElevatedButton(
                onPressed: () => prediction(
                    'https://efdd-34-145-3-113.ngrok-free.app/sample'),
                child: Text("CHECK"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.indigo,
                  onPrimary: Colors.white,
                  minimumSize: Size(200, 100),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class ResultScreen extends StatelessWidget {
  final String predictionLabel;
  final String predictionScore;

  ResultScreen({
    Key? key,
    required this.predictionLabel,
    required this.predictionScore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SkinproblemShooter"),
        backgroundColor: Colors.indigoAccent,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pushNamed(context, '/one'),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Atopic Dermatitis: $predictionLabel',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Confidence: $predictionScore%',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            SizedBox(height: 48),
            Container(
              width: 300, // Container의 너비를 300으로 설정
              height: 300, // Container의 높이를 300으로 설정
              child: Image.network(
                "https://ioncosmetic.com/wp-content/uploads/2022/12/%EC%95%84%ED%86%A0%ED%94%BC-%ED%94%BC%EB%B6%80%EC%97%BC-%EC%9B%90%EC%9D%B8-%EC%A6%9D%EC%83%81-%EC%B9%98%EB%A3%8C-%EA%B4%80%EB%A6%AC.jpg",
                fit: BoxFit.cover, // 이미지가 Container의 크기에 맞게 조절되도록 설정
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // TODO: 연결할 ChatGPT 기능 추가
              },
              child: Text('Go to Chat'),
              style: ElevatedButton.styleFrom(
                primary: Colors.indigo, // 버튼의 배경색을 인디고로 설정
                onPrimary: Colors.white, // 버튼의 텍스트 색상을 흰색으로 설정
                minimumSize: Size(200, 100), // 버튼의 최소 사이즈를 200x100으로 설정
                shape: RoundedRectangleBorder(
                  // 버튼의 모양을 정의
                  borderRadius: BorderRadius.circular(50), // 버튼의 모서리를 둥글게 설정
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
