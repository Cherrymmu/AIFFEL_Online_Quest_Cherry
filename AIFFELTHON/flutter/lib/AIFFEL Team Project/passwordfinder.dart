import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class passWordFinder extends StatefulWidget {
  const passWordFinder({super.key});

  @override
  State<passWordFinder> createState() => _passWordFinderState();
}

class _passWordFinderState extends State<passWordFinder> {
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      home: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Scaffold(
          backgroundColor: Color(0xFFE7E1DE),
          appBar: AppBar(
              backgroundColor: Color(0xFFE7E1DE),
              toolbarHeight: 60,
              leading: Center(
                  child: SizedBox(
                    height: 60,
                    child: IconButton(
                      icon: Icon(
                        CupertinoIcons.back,
                        color: Colors.black,
                        size: 24,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  )
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: (
                          SizedBox(
                            height: 30,
                            child: Text(
                              '비밀번호 찾기',
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black
                              ),
                            ),
                          )
                      )
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/six');
                      },
                      icon: Icon(Icons.settings)
                  )
                ],
              )
          ),
          body: Center(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 20,),
                  Text(
                    '피부엔에 가입했던 이메일을 입력해주세요. \n비밀번호 재설정 메일을 보내드립니다.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      color: Colors.black
                    ),
                  ),
                  SizedBox(height: 20,),
                  TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '이메일을 입력하세요...'
                    ),
                  ),
                  Spacer(),
                  Padding(
                        padding: EdgeInsets.all(12.0),
                        child: ElevatedButton(
                            onPressed: () {

                            },
                            style: ElevatedButton.styleFrom(
                                minimumSize: Size(430, 72),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0)
                                ),
                                backgroundColor: Color(0xFFAA9788)
                            ),
                            child: Text(
                              '비밀번호 재설정하기',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 20.0,
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
      ),
    );
  }
}
