import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'CustomAppBar.dart';
import 'main.dart';


class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isPushNotificationsEnabled = false;
  bool isTextNotificationsEnabled = false;
  bool isProfilePublic = false;

  void logout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushNamedAndRemoveUntil('/one', (Route<dynamic> route) => false);
  }

  Widget buildSettingItem(String title, {VoidCallback? onTap, bool showArrow = false, bool isConnected = false}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 20.0),
        margin: EdgeInsets.symmetric(vertical: 2.0),
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(color: Color(0xFFAA9788).withOpacity(0.5)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  color: Colors.black
              ),
            ),
            // 연결 상태 또는 ">" 아이콘을 조건부로 표시
            showArrow
                ? Icon(Icons.navigate_next, color: Colors.black)
                : Text(
              isConnected ? "Connected" : "Disconnected",
              style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  color: Colors.black
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget buildCustomSwitchListTile(String title, bool value, Function(bool) onChanged) {
    return InkWell(
      onTap: () => onChanged(!value),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
        margin: EdgeInsets.symmetric(vertical: 2.0),
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(color: Color(0xFFAA9788).withOpacity(0.5)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16.0,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Switch(
              value: value,
              onChanged: onChanged,
            ),
          ],
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    final bool isGoogleIDConnected = Provider.of<ProfileData>(context).isLoggedin;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFE7E1DE),
        appBar: CustomAppBar(
            titleText: 'Settings',
            onBackPressed: () {
              Navigator.pop(context);
            }),
        body: ListView(
          padding: const EdgeInsets.all(20.0),
          children: <Widget>[
            Text(
                '계정',
                style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                )
            ),
            SizedBox(height: 5),
            buildSettingItem(
              '프로필 수정',
              showArrow: true,
              onTap: () {
                // TODO: 실제로는 여기서 새 화면으로 네비게이션하도록 구현
                Navigator.pushNamed(context, '/ten');
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('프로필 설정 화면으로 이동')),
                );
              },
            ),
            buildSettingItem(
                '구글 계정',
                isConnected: isGoogleIDConnected
            ),
            SizedBox(height: 20.0),
            Text('알림',
                style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                )
            ),
            SizedBox(height: 10),
            buildCustomSwitchListTile(
              'Push 알림',
              isPushNotificationsEnabled,
                  (bool value) {
                setState(() {
                  isPushNotificationsEnabled = value;
                });
              },
            ),
            buildCustomSwitchListTile(
              '문자 알림',
              isTextNotificationsEnabled,
                  (bool value) {
                setState(() {
                  isTextNotificationsEnabled = value;
                });
              },
            ),
            SizedBox(height: 50),
            ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      useRootNavigator: true,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: Color(0xFFE7E1DE),
                          title: Text(
                            '로그아웃',
                            style: TextStyle(
                              fontSize: 30,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold
                            ),
                            textAlign: TextAlign.center,
                          ),
                          content: Container(
                            width: 200,
                            height: 30,
                            child: Text(
                              '로그아웃 하시겠습니까?',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          actions: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      '취소',
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.bold
                                      ),
                                    )
                                ),
                                TextButton(
                                    onPressed: () {
                                      logout();
                                    },
                                    child: Text(
                                      '확인',
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.bold
                                      ),
                                    )
                                )
                              ],
                            )
                          ],
                        );
                      }
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(430, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)
                  ),
                  backgroundColor: Colors.white,
                      
                ),
                child: Text(
                  '로그아웃',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}
