import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'CustomAppBar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController useremailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _userEmail = '';
  String _userPassword = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GestureDetector(
        onTap: () {
          // 현재 포커스를 얻어온 다음 키보드를 숨깁니다.
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Scaffold(
          backgroundColor: Color(0xFFE7E1DE),
          appBar: CustomAppBar(
              titleText: '회원가입',
              onBackPressed: () {
                Navigator.pop(context);
              },
              onSettingPressed: () {
                Navigator.pushNamed(context, '/six');
              }
          ),
          body: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 20.0, right: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'E-Mail',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                    ),
                  ),
                  SizedBox(height: 5),
                  //사용자 이메일 입력 필드
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: useremailController,
                    focusNode: emailFocusNode,
                    validator: (value) => CheckValidate().validateEmail(emailFocusNode, value!),
                    onSaved: (value) {
                      _userEmail = value!;
                    },
                    onChanged: (value) {
                      _userEmail = value!;
                    },
                    decoration: InputDecoration(
                      fillColor: Color(0xFFFFFFFF),
                      filled: true,
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.black,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0)
                        )
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.grey
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0)
                        )
                      ),
                      hintText: '이메일을 입력하세요.',
                      hintStyle: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                      ),
                      contentPadding: EdgeInsets.all(14.0)
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Password',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                    ),
                  ),
                  SizedBox(height: 5.0),
                  //사용자 이메일 입력 필드
                  TextFormField(
                    obscureText: true,
                    controller: passwordController,
                    focusNode: passwordFocusNode,
                    validator: (value) => CheckValidate().validatePassword(passwordFocusNode, value!),
                    onSaved: (value) {
                      _userPassword = value!;
                    },
                    onChanged: (value) {
                      _userPassword = value!;
                    },
                    decoration: InputDecoration(
                        fillColor: Color(0xFFFFFFFF),
                        filled: true,
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.black,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey
                            ),
                            borderRadius: BorderRadius.all(
                                Radius.circular(12.0)
                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey
                            ),
                            borderRadius: BorderRadius.all(
                                Radius.circular(12.0)
                            )
                        ),
                      hintText: '비밀번호를 입력하세요.',
                      hintStyle: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey
                      ),
                      contentPadding: EdgeInsets.all(14.0)
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Confirm Password',
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                    ),
                  ),
                  SizedBox(height: 5.0),
                  TextFormField(
                    obscureText: true,
                    controller: confirmPasswordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '비밀번호를 다시 입력하세요.';
                      }
                      if (value != passwordController.text) {
                        return '비밀번호가 일치하지 않습니다.';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        fillColor: Color(0xFFFFFFFF),
                        filled: true,
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.black,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey
                            ),
                            borderRadius: BorderRadius.all(
                                Radius.circular(12.0)
                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey
                            ),
                            borderRadius: BorderRadius.all(
                                Radius.circular(12.0)
                            )
                        ),
                        hintText: '비밀번호를 한번 더 입력하세요.',
                        hintStyle: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey
                        ),
                        contentPadding: EdgeInsets.all(14.0)
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(bottom: 35.0),
                    child: ElevatedButton(
                        onPressed: () {
                          if (passwordController.text == confirmPasswordController.text) {
                            signUp();
                          } else {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text('비밀번호 불일치'),
                                content: Text('비밀번호 확인이 일치하지 않습니다.'),
                                actions: <Widget>[
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('닫기')
                                  )
                                ],
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(430, 72),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0)
                            ),
                            backgroundColor: Color(0xFFAA9788)
                        ),
                        child: Text(
                          '회원가입',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFFFFFFF)
                          ),
                        )
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signUp() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
          email: useremailController.text.trim(),
          password: passwordController.text.trim());

      // 사용자가 생성된 후, Firestore에 정보를 저장합니다.
      User? user = userCredential.user;
      if (user != null && user.email != null) {
        // 이메일 인증 전송
        await user.sendEmailVerification();

        // Firestore에 사용자 정보 추가
        await FirebaseFirestore.instance.collection('Users').doc(user.uid).set({
          'Email': user.email,
          // 추가하고 싶은 다른 정보들을 여기에 포함시킵니다.
        });

        Navigator.of(context).pop();
      }
    } on FirebaseException catch (e) {
      // Firebase 예외 처리
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      } else {
        print(e.message); // 사용자에게 오류 메시지를 보다 친절하게 알릴 방법을 고려하세요.
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void dispose() {
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }
}

class CheckValidate {
  String? validateEmail(FocusNode focusNode, String value) {
    if (value.isEmpty) {
      focusNode.requestFocus();
      return '이메일을 입력하세요.';
    } else {
      RegExp pattern = RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
      if (!pattern.hasMatch(value)) {
        focusNode.requestFocus(); //포커스를 해당 textformfield에 맞춘다.
        return '잘못된 이메일 형식입니다.';
      } else {
        return null;
      }
    }
  }

  String? validatePassword(FocusNode focusNode, String value) {
    if (value.isEmpty) {
      focusNode.requestFocus();
      return '비밀번호를 입력하세요.';
    } else {
      RegExp pattern = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?~^<>,.&+=])[A-Za-z\d$@$!%*#?~^<>,.&+=]{8,15}$');
      if (!pattern.hasMatch(value)) {
        focusNode.requestFocus();
        return '특수문자, 대소문자, 숫자 포함 8자 이상 15자 이내로 입력하세요.';
      } else {
        return null;
      }
    }
  }
}