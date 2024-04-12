import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'CustomAppBar.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'main.dart';


class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isCheked = false;
  bool isInput = true;

  String? _emailError;
  String? _passwordError;


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
              titleText: 'Login',
              onBackPressed: () {
                Navigator.pop(context);
              },
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
                  SizedBox(height: 5.0),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    decoration: InputDecoration(
                      fillColor: Color(0xFFFFFFFF),
                      filled: true,
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.black,
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
                      hintText: '이메일을 입력하세요.',
                      hintStyle: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                      contentPadding: EdgeInsets.all(14.0),
                      errorText: _emailError
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Password',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                    ),
                  ),
                  SizedBox(height: 5.0),
                  TextFormField(
                    obscureText: true,
                    controller: _passwordController,
                    decoration: InputDecoration(
                        fillColor: Color(0xFFFFFFFF),
                        filled: true,
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.black,
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
                        hintText: '비밀번호를 입력하세요.',
                        hintStyle: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                        contentPadding: EdgeInsets.all(14.0),
                      errorText: _passwordError
                    ),
                  ),
                  SizedBox(height: 5.0),
                  // Row(
                  //   children: [
                  //     Checkbox(
                  //         value: _isCheked,
                  //         onChanged: (bool? newValue) {
                  //           setState(() {
                  //             _isCheked = newValue!;
                  //           });
                  //         }),
                  //     Text('Login 저장'),
                  //     Spacer(),
                  //     TextButton(
                  //         onPressed: () {
                  //           Navigator.pushNamed(context, '/seven');
                  //         },
                  //         child: Text(
                  //           'Forget Password?',
                  //           style: TextStyle(
                  //             fontSize: 15.0,
                  //             fontFamily: 'Roboto',
                  //             fontWeight: FontWeight.bold,
                  //             color: Color(0xFFAA9784)
                  //           ),
                  //         )
                  //     ),
                  //   ],
                  // ),
                  SizedBox(height: 35.0),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/five');
                      },
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(430, 60),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0)
                          ),
                          backgroundColor: Color(0xFFFFFFFF)
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.mail,
                            color: Colors.black,
                          ),
                          SizedBox(width: 10.0),
                          Text(
                            '이메일로 가입하기',
                            style: TextStyle(
                                fontSize: 16.0,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                            ),
                          )
                        ],
                      )
                  ),
                  SizedBox(height: 10.0),
                  ElevatedButton(
                      onPressed: () {
                        signInWithGoogle();
                      },
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(430, 60),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0)
                          ),
                          backgroundColor: Color(0xFFFFFFFF)
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'images/google_logo.png',
                            height: 24.0,
                          ),
                          SizedBox(width: 10.0),
                          Text(
                            'Sign In With Google',
                            style: TextStyle(
                                fontSize: 16.0,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                            ),
                          )
                        ],
                      )
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(bottom: 35.0),
                    child: ElevatedButton(
                        onPressed: () {
                          _login();
                        },
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(430, 72),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0)
                            ),
                            backgroundColor: Color(0xFFAA9788)
                        ),
                        child: Text(
                          '로그인',
                          style: TextStyle(
                              fontSize: 20.0,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFFFFFFF)
                          ),
                        )
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      )
    );
  }

  Future<void> _login() async {
    if (_formKey.currentState?.validate() ?? false) {
      FocusScope.of(context).requestFocus(FocusNode());

      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: _emailController.text,
            password: _passwordController.text,
        ). then((value) {
          print(value);
          if (value.user?.emailVerified ?? false) {
            Provider.of<ProfileData>(context, listen: false).updateEmail(_emailController.text);
            Navigator.pushNamed(context, '/three');
          } else {
            setState(() {
              _emailError = '이메일 인증 오류 또는 사용자 정보 없음';
            });
          }
          return value;
        });
      } on FirebaseException catch (e) {
        if (e.code == 'user-not-found') {
          setState(() {
            _emailError = '사용자를 찾을 수 없습니다.';
            _passwordError = null;
          });
        } else if (e.code == 'wrong-password') {
          setState(() {
            _passwordError = '비밀번호를 확인하세요.';
            _emailError = null;
          });
        } else if (e.code == 'invalid-email') {
          setState(() {
            _emailError = '유효하지 않은 이메일 형식입니다.';
            _passwordError = null;
          });
        } else {
          setState(() {
            _emailError = '로그인 중 오류가 발생했습니다. 잠시후 다시 시도해주세요.';
            _passwordError = null;
          });
        }
      }
    }
  }

  // Google 로그인 함수
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Check if the sign in was successful
    if (googleUser != null) {
      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

      // Check if sign in was successful
      if (userCredential.user != null) {
        // 로그인 성공: ProfileData의 로그인 상태 업데이트
        Provider.of<ProfileData>(context, listen: false).login();

        Navigator.pushNamed(context, '/three');
      }

      return userCredential;
    } else {
      // Google 로그인이 취소되거나 실패한 경우
      throw Exception('Google 로그인 실패');
    }
  }
}