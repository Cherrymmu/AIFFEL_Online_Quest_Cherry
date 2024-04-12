import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_app/firebase_options.dart';
import 'package:flutter/material.dart';
import 'dart:developer' show log;
import 'package:kakao_map_plugin/kakao_map_plugin.dart';
import 'firestorecloud.dart';
import 'package:provider/provider.dart';
import 'package:permission_handler/permission_handler.dart';

import 'splashscreen.dart';
import 'pi_main.dart';
import 'camera.dart';
import 'login.dart';
import 'Pibuanchat.dart';
import 'signuppage.dart';
import 'settingsscreen.dart';
import 'passwordfinder.dart';
import 'checking.dart';
import 'kakao_map.dart';
import 'profile_1.dart';

class ProfileData with ChangeNotifier {
  List<dynamic>? _results;
  String? _email;

  List<dynamic>? get results => _results;
  String? get email => _email;

  bool _isLoggedin = false;

  bool get isLoggedin => _isLoggedin;

  void updateResults(List<dynamic>? newResults) {
    _results = newResults;
    print("Results updated: $_results");
    notifyListeners();
  }

  void updateEmail(String email) {
    _email = email;
    print("Email updated: $_email");
    notifyListeners();
  }
  void login() {
    _isLoggedin = true;
    notifyListeners();
  }

  void logout() {
    _isLoggedin = false;
    notifyListeners();
  }
}

void main() async {
  AuthRepository.initialize(appKey: '4bff35617b2f0f1652b372c19e991a1a');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // 권한 요청 함수 호출
  String permissionsResult = await callPermissions();
  print("Permissions result: $permissionsResult");

  runApp(
    ChangeNotifierProvider(
      create: (context) => ProfileData(),
      child: MyApp()
    ),
  );
}

// 권한 요청 함수
Future<String> callPermissions() async {
  Map<Permission, PermissionStatus> statuses = await [
    Permission.location,
    Permission.camera,
    Permission.storage,
    // 필요한 다른 권한들을 여기에 추가하세요
  ].request();

  if (statuses.values.every((element) => element.isGranted)) {
    return 'success';
  }
  return 'failed';
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/one': (context) => PiApp(),
        '/two': (context) => Login(),
        '/three': (context) => Camera(),
        '/four': (context) => ChatScreen(),
        '/five': (context) => SignInPage(),
        '/six' : (context) => SettingsScreen(),
        '/seven': (context) => passWordFinder(),
        '/eight': (context) => QuizScreen(),
        '/nine' : (context) => KakaoMaps(),
        '/ten' : (context) => ProfileScreen(),
      },
    );
  }
}