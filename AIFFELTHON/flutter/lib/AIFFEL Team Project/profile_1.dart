import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'CustomAppBar.dart'; // 사용자 정의 AppBar 위젯

class ProfileScreen extends StatefulWidget {
  final String? userId;
  final List<dynamic>? results2;

  const ProfileScreen({this.userId, this.results2});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  String? userEmail; // 사용자 이메일
  String? skinDisease; // 사용자 병명
  String? googleAccount; // Google 계정 정보




  @override
  void initState() {
    super.initState();
    _loadUserProfile();
  }

  Future<void> _loadUserProfile() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      final userDoc =
          FirebaseFirestore.instance.collection('users').doc(user.uid);
      final snapshot = await userDoc.get();
      if (snapshot.exists) {
        setState(() {
          _userNameController.text = snapshot.data()?['username'] ?? '';
          _phoneNumberController.text = snapshot.data()?['phoneNumber'] ?? '';
          userEmail = user.email; // Firebase Auth에서 가져온 이메일
          googleAccount = snapshot.data()?['googleAccount'];
          var profileData;
          skinDisease = profileData.results?[0]['SkinDisease'];
        });
      }
    }

    // 'results2' 리스트에서 병명 정보를 가져옵니다.
    if (widget.results2 != null && widget.results2!.isNotEmpty) {
      setState(() {
        skinDisease = widget.results2![0]['SkinDisease']; // 가정된 병명 필드
      });
    }
  }

  Future<void> _updateUserProfile() async {
    User? user = FirebaseAuth.instance.currentUser;

    // Firestore 데이터 업데이트를 위한 준비
    Map<String, dynamic> updates = {
      'username': _userNameController.text,
      'phoneNumber': _phoneNumberController.text,
    };

    // 'results2'에서 병명 정보가 있다면 업데이트 데이터에 포함
    if (widget.results2 != null && widget.results2!.isNotEmpty) {
      updates['skinDisease'] =
          widget.results2![0]['SkinDisease']; // 'results2' 구조에 따라 조정 필요
    }

    // Firestore 데이터 업데이트
    final userDoc = FirebaseFirestore.instance.collection('users').doc(widget.userId);
    await userDoc.update(updates);

    // 비밀번호가 입력되었다면 Firebase Auth에서 비밀번호 업데이트
    if (_passwordController.text.isNotEmpty) {
      user?.updatePassword(_passwordController.text).then((_) {
        // 비밀번호 업데이트 성공
      }).catchError((error) {
        // 비밀번호 업데이트 실패
        print("비밀번호 업데이트 에러: $error");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
            backgroundColor: Color(0xFFE7E1DE),
            appBar: CustomAppBar(
              titleText: '프로필 수정',
              onBackPressed: () {
                Navigator.pop(context);
              },
            ),
            body: Consumer<ProfileData>(
              builder: (context, profileData, child) {
                String skinDiseaseText = 'Not available';
                if (profileData.results != null && profileData.results!.isNotEmpty) {
                  final result = profileData.results![0];
                  if (result.containsKey('label')) {
                    skinDiseaseText = result['label'] ?? 'Not available';
                  }
                }
                return Form(
                    key: _formKey,
                    child: Padding(
                      padding: EdgeInsets.only(top: 15, left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            keyboardType: TextInputType.text,
                            controller: _userNameController,
                            decoration: InputDecoration(
                                fillColor: Color(0xFFFFFFFF),
                                filled: true,
                                prefixIcon: Icon(
                                  Icons.account_circle,
                                  color: Colors.black,
                                  size: 24.0,
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(12.0)
                                    )
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(12.0)
                                    )
                                ),
                                hintText: '사용자 이름을 입력하세요...',
                                hintStyle: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                                contentPadding: EdgeInsets.all(20.0),
                            ),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            obscureText: true,
                            controller: _passwordController,
                            decoration: InputDecoration(
                                fillColor: Color(0xFFFFFFFF),
                                filled: true,
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.black,
                                  size: 24.0,
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(12.0)
                                    )
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(12.0)
                                    )
                                ),
                                hintText: '변경 하려는 비밀번호를 입력하세요...',
                                hintStyle: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                                contentPadding: EdgeInsets.all(20.0),
                            ),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: _phoneNumberController,
                            decoration: InputDecoration(
                                fillColor: Color(0xFFFFFFFF),
                                filled: true,
                                prefixIcon: Icon(
                                  Icons.phone,
                                  color: Colors.black,
                                  size: 24.0,
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(12.0)
                                    )
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(12.0)
                                    )
                                ),
                                hintText: '변경 하려는 전화번호를 입력하세요...',
                                hintStyle: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                                contentPadding: EdgeInsets.all(20.0),
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            width: 430,
                            height: 60,
                            padding: EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                                color: Color(0xFFFFFFFF),
                                border: Border.all(
                                    color: Colors.grey
                                ),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(12.0)
                                )
                            ),

                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.mail),
                                SizedBox(width: 10,),
                                Text(
                                  'E-mail: ${profileData.email}',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.bold
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            )
                          ),
                          SizedBox(height: 10),
                          Container(
                            width: 430,
                            height: 60,
                            padding: EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                              color: Color(0xFFFFFFFF),
                              border: Border.all(
                                color: Colors.grey
                              ),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(12.0)
                              )
                            ),

                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.local_hospital),
                                SizedBox(width: 10),
                                Text(
                                  'Skin Disease: $skinDiseaseText',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.bold
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            )
                          ),
                          SizedBox(height: 10),
                          Spacer(),
                          Padding(
                            padding: EdgeInsets.only(bottom: 35),
                            child: ElevatedButton(
                              onPressed: _updateUserProfile,
                              style: ElevatedButton.styleFrom(
                                  minimumSize: Size(430, 72),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0)
                                  ),
                                  backgroundColor: Color(0xFFAA9788)
                              ),
                              child: Text(
                                '변경 된 내용 저장',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFFFFFFF)
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                );
              },
            )
        ),
      )
    );
  }
}