import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'CustomAppBar.dart';
import 'profile_1.dart';
import 'main.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class ChatScreen extends StatefulWidget {
  final List<dynamic>? results;

  ChatScreen({this.results});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class Message {
  String text;
  bool isSentByMe;

  Message({required this.text, required this.isSentByMe});
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  List<Message> messages = [];
  late GenerativeModel model;

  @override
  void initState() {
    super.initState();
    if (widget.results != null && widget.results!.isNotEmpty){

    }
    final safetySettings = [
      SafetySetting(HarmCategory.harassment, HarmBlockThreshold.high),
      SafetySetting(HarmCategory.hateSpeech, HarmBlockThreshold.high),
      SafetySetting(HarmCategory.sexuallyExplicit, HarmBlockThreshold.high),
      SafetySetting(HarmCategory.dangerousContent, HarmBlockThreshold.high),
    ];
    model = GenerativeModel(
      apiKey: "발급한 API 키 입력", // 실제 API 키로 교체하세요.
      model: "gemini-pro",
      generationConfig: GenerationConfig(
        temperature: 0.6,
        topP: 1,
        topK: 1,
        maxOutputTokens: 2048,
      ),
      safetySettings: safetySettings,
    );
  }

  void _sendMessage() async {
    final String userMessage = _controller.text; // 사용자가 입력한 메시지
    if (userMessage.isNotEmpty) {
      // UI에 사용자의 메시지 표시
      setState(() {
        messages.add(Message(text: userMessage, isSentByMe: true));
        _controller.clear();
      });

      try {
        // 챗봇과 대화 시작
        var chat = model.startChat(history: [
          Content.text(
              """네 이름은 '피부엔봇'이야. 사용자가 특정 피부 병변(예: 여드름, 흑색종)에 대해 질문할 때, 그 병변에 대한 치료 방안을 한국어로만 알려줘. 
              만약 사용자가 구체적인 피부 병변 이름을 언급하지 않고 질문한다면, '어떤 피부 병변에 대해 궁금하세요?'라고 물어봐. 
              치료 방안을 제공하기 전에, 항상 '주의) 실제 치료는 피부과 전문의의 진단과 권고에 따라 달라질 수 있으며, 특정 개인의 상황에 맞춘 맞춤형 치료가 필요할 수 있습니다. 정확한 진단과 치료를 위해서는 반드시 피부과 전문의를 찾아 상담하시기 바랍니다.'라고 알려줘.
              치료방안을 설명한 후에는, '내 주변 병원 위치보기 버튼을 누르면 병원을 고를 수 있습니다.' 라고 안내해. 이 버튼은 실제로 존재하기 때문에, 생성할 필요는 없어.
              만약 피부 판별 결과 혹은 결과가 성능이 너무 낮게 나왔다'는 피드백을 받는다면, '예상되는 피부병 체크해보기' 버튼을 누르시면 추가 정보를 얻을 수 있다고 안내해."""),
          Content.model([
            TextPart(
                """주의) 실제 치료는 피부과 전문의의 진단과 권고에 따라 달라질 수 있으며, 특정 개인의 상황에 맞춘 맞춤형 치료가 필요할 수 있습니다. 
                정확한 진단과 치료를 위해서는 반드시 피부과 전문의를 찾아 상담하시기 바랍니다.\n\n어떤 피부 병변에 대해 궁금하세요?""")
          ])
        ]);

        // 사용자의 메시지를 챗봇에 전송하고 응답을 받음
        var content = Content.text(userMessage);
        var response = await chat.sendMessage(content);
        print(response.text);
        // 챗봇의 응답을 UI에 표시

        setState(() {
          String chatbotResponse = response.text as String; // 챗봇의 응답을 문자열로 변환
          // '**' 제거
          chatbotResponse = chatbotResponse.replaceAll('**', '');
          // '##' 사이의 텍스트 제거
          chatbotResponse =
              chatbotResponse.replaceAll(RegExp(r'##(.*?)##'), '');
          // '###' 사이의 텍스트 제거
          chatbotResponse =
              chatbotResponse.replaceAll(RegExp(r'###(.*?)###'), '');

          // 처리된 응답을 메시지 리스트에 추가
          messages.add(Message(text: chatbotResponse, isSentByMe: false));
        });
      } catch (e) {
        // 에러 처리: 챗봇 호출 중 에러가 발생한 경우
        setState(() {
          // 챗봇 호출 에러 메시지를 사용자에게 표시
          String errorMessage = "죄송합니다. 문제가 발생했습니다. 피부 병변명을 넣고 질문해주세요.";
          messages.add(Message(text: errorMessage, isSentByMe: false));
        });
      }
    } else {
      // 사용자가 메시지를 입력하지 않았을 경우의 처리
      setState(() {
        // 사용자에게 메시지 입력을 요청하는 안내 메시지를 챗봇 창에 표시
        String promptMessage = "메시지를 입력해주세요.";
        messages.add(Message(text: promptMessage, isSentByMe: false));
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
          backgroundColor: Color(0xFFE7E1DE),
          appBar: CustomAppBar(
              titleText: 'Pibuanchat',
              onBackPressed: () {
                Navigator.pop(context);
              },
              onSettingPressed: () {
                Navigator.pushNamed(context, '/six');
              }
          ),
          body: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Center(
                  child: Text(
                    """여러가지 피부병의 치료방안을 질문해보세요\n피부 판별 결과가 낮을 때 챗봇에게 안내 받으세요.""",
                    textAlign: TextAlign.center, // 텍스트 정렬을 중앙으로 설정
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  reverse: true,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        final msg = messages[index];
                        return Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0,
                              vertical: 5.0), // 내용과 컨테이너 경계 사이의 여백 조정
                          margin: EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 8.0), // 컨테이너 주변 여백 조정
                          decoration: BoxDecoration(
                            color: msg.isSentByMe
                                ? Color(0xFFAA9788)
                                : Color(0xFFFFFFFF), // 메시지 배경색 설정
                            borderRadius:
                            BorderRadius.circular(20.0), // 원형 또는 원형에 가까운 모양 설정
                          ),
                          child: Column(
                            crossAxisAlignment: msg.isSentByMe
                                ? CrossAxisAlignment.end
                                : CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                msg.text,
                                style: TextStyle(
                                  color: Colors.black, // 텍스트 색상 설정
                                ),
                              ),
                              Text(
                                msg.isSentByMe ? "나" : "피부엔봇",
                                style: TextStyle(
                                  color: Colors.black
                                      .withOpacity(0.6), // 부제목 텍스트 색상 설정
                                  fontSize: 12, // 부제목 텍스트 크기 설정
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(right: 10, left: 10, bottom: 10),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person,
                            size: 30,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent
                            )
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent
                            )
                          ),
                          hintText: '메시지를 입력하세요...',
                          hintStyle: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            color: Colors.black
                          )
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                          Icons.send_rounded
                      ),
                      onPressed: _sendMessage,
                    ),
                  ],
                ),
              ),
              // 새로운 버튼들 추가
              Container(
                height: 70, // 버튼들이 들어갈 공간의 높이 설정
                child: Padding(
                  padding: EdgeInsets.only(left: 15, right: 15, bottom: 10),
                  child: ListView(
                    scrollDirection: Axis.horizontal, // 가로 스크롤 설정
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          // 첫 번째 버튼의 동작 정의
                          showDialog(
                              context: context,
                              useRootNavigator: true,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor: Color(0xFFE7E1DE),
                                  title: Text(
                                    '피부 질환 결과 확인',
                                    textAlign: TextAlign.center,
                                  ),
                                  content: Container(
                                    width: 350,
                                    height: 200,
                                    child: SingleChildScrollView(
                                        child: Text(
                                          '결과:\n\n' + (widget.results?.map((result) {
                                            // 각 결과에 대해 문자열로 변환
                                            return "피부병변: ${result['label']}\n예측확률: ${((result['confidence'] as double) * 100).toStringAsFixed(0)}%";
                                          }).join('\n\n') ?? "결과가 없습니다."), // 변환된 문자열들을 개행 문자로 연결
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black
                                          ),
                                        )
                                    ),
                                  ),
                                  actions: <Widget>[
                                    Container(
                                      width: double.infinity,
                                      padding: EdgeInsets.only(bottom: 10),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          print("Updating results: ${widget.results}");
                                          Provider.of<ProfileData>(context, listen: false).updateResults(widget.results);
                                          Navigator.pop(context);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          minimumSize: Size(230, 50),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20)
                                          )
                                        ),
                                        child: Text(
                                          '닫기',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                );
                              }
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white, // 버튼의 배경색을 하얀색으로 설정
                          foregroundColor: Colors.black, // 버튼의 텍스트 색상을 검은색으로 설정
                          side: BorderSide(
                              color: Color(0xFFAA9788), width: 1.5), // 버튼의 테두리를 설정
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)
                          ),
                        ), // 버튼의 모서리를 둥글게 설정
                        child: Text('피부 질환 결과 확인하기'),
                      ),
                      SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: () {
                          // 두 번째 버튼의 동작 정의
                          Navigator.pushNamed(context, '/eight');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white, // 버튼의 배경색을 하얀색으로 설정
                          foregroundColor: Colors.black, // 버튼의 텍스트 색상을 검은색으로 설정
                          side: BorderSide(
                              color: Color(0xFFAA9788), width: 1.5), // 버튼의 테두리를 설정
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8), // 버튼의 모서리를 둥글게 설정
                          ),
                        ),
                        child: Text('예상되는 피부병 체크해보기'),
                      ),
                      SizedBox(width: 20), // 버튼 사이의 간격
                      ElevatedButton(
                        onPressed: () {
                          // 세 번째 버튼의 동작 정의
                          Navigator.pushNamed(context, '/nine');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white, // 버튼의 배경색을 하얀색으로 설정
                          foregroundColor: Colors.black, // 버튼의 텍스트 색상을 검은색으로 설정
                          side: BorderSide(
                              color: Color(0xFFAA9788), width: 1.5), // 버튼의 테두리를 설정
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8), // 버튼의 모서리를 둥글게 설정
                          ),
                        ),
                        child: Text('내 주변 병원 위치보기'),
                      ),
                      // 필요한 만큼 더 많은 버튼을 추가할 수 있습니다.
                    ],
                  ),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
