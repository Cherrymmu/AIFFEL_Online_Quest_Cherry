import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/AIFFEL%20Team%20Project/CustomAppBar.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class QuestionClass {
  final String className;
  final List<String> questions;
  final String imagePath;

  QuestionClass(
      {required this.className,
      required this.questions,
      required this.imagePath});
}

class _QuizScreenState extends State<QuizScreen> {
  bool isImageVisible = false;
  int currentClassIndex = 0;
  List<QuestionClass> allClasses = [
    QuestionClass(
      className: '여드름',
      questions: [
        "얼굴, 가슴, 등 등에 붉은색 또는 피부색의 돌기가 있습니까?",
        "이 돌기들 중 일부가 고름을 포함하고 있습니까?",
        "이 돌기들이 자주 염증을 일으키거나 아프습니까?",
        "피부에 검은색 또는 백색의 작은 점들이 보이습니까? (여드름 코미도)",
        "최근에 사용한 화장품, 세안제 또는 모발 제품으로 인해 피부 상태가 악화되었습니까?",
        "스트레스가 증가하거나 식습관이 변했을 때 피부 상태가 나빠지는 경향이 있습니까?",
        "여드름이 가족 중 다른 사람들에게도 있습니까? (유전적 경향)",
        "평소보다 땀을 많이 흘린 후 피부 상태가 나빠지는 경향이 있습니까?",
        "피부에 심한 가려움증이나 통증을 동반한 붉은색 부위가 있습니까?",
        "여드름과 유사한 증상을 경험한 지 3개월 이상 되었습니까?"
      ],
      imagePath: 'images/1_여드름_2.jpg',
    ),
    QuestionClass(
      className: '아토피 피부염',
      questions: [
        "피부가 매우 건조하며, 가려움증을 자주 느낍니까?",
        "피부에 심한 건조함과 가려움증 외에도, 겨울철이나 건조한 환경에서 피부 증상이 더욱 악화되나요?",
        "팔꿈치 안쪽, 무릎 뒤쪽, 목, 얼굴 또는 손등에 염증이나 발진이 있습니까?",
        "가려움증이 밤에 더 심해져 수면을 방해합니까?",
        "피부에 붉은색 또는 피부색보다 어두운 반점이 있습니까?",
        "아토피 피부염, 천식 또는 알레르기성 비염과 같은 알레르기 질환이 가족력에 있습니까?",
        "계절 변화, 스트레스, 특정 식품 또는 환경적 요인으로 인해 피부 상태가 악화됩니까?",
        "어린 시절부터 피부 문제를 겪어 왔습니까?",
        "피부에 접촉한 특정 물질(예: 비누, 세제, 일부 의류 소재 등)로 인해 피부가 자극 받고 상태가 악화됩니까?",
        "피부 감염을 자주 경험합니까? (예: 황색 포도상구균 감염)"
      ],
      imagePath: 'images/2_아토피_2.jpg',
    ),
    QuestionClass(
      className: '기저세포암',
      questions: [
        "피부에 진주처럼 빛나는 또는 유리알 같이 보이는 작은 결절이 있습니까?",
        "피부의 특정 부위가 지속적으로 출혈하거나 딱지가 생기는데, 치유되지 않습니까?",
        "상처와 비슷한 모양이지만, 시간이 지나도 낫지 않는 부위가 있습니까?",
        "피부에 붉은색 패치가 있으며, 이 부위가 가렵거나 아프지 않습니까?",
        "피부에 작은 투명한 구슬처럼 보이는 성장물이 있습니까?",
        "햇빛에 자주 노출되는 피부 영역(예: 얼굴, 목, 손등)에 비정상적인 피부 변화가 있습니까?",
        "피부에 변화가 있는 부위 주변으로 작은 혈관이 보이거나 혈관이 확장된 것처럼 보입니까?",
        "성장하는 피부 종양이 가운데가 움푹 들어간 모양을 하고 있습니까?",
        "피부에 새로운 성장물이나 변화를 보이는 부위가 있지만, 통증이 없습니까?",
        "가족 중에 피부암 병력이 있습니까?"
      ],
      imagePath: 'images/3_기저세포암_2.jpg',
    ),
    QuestionClass(
      className: '양성 각화 유사 병변',
      questions: [
        "피부에 색소가 침착되거나, 색이 변한 병변이 있습니까?",
        "피부 병변이 거칠거나 비늘 모양의 표면을 가지고 있습니까?",
        "피부 병변 주위의 피부와 비교했을 때, 병변이 더 두껍게 느껴집니까?",
        "피부 병변이 시간이 지남에 따라 서서히 커지고 있습니까?",
        "피부에 돌출된 또는 약간의 돌기가 있는 병변이 있습니까?",
        "병변이 하나 이상의 색상(갈색, 검은색, 붉은색 등)을 보이고 있습니까?",
        "병변이 태양 노출이 많은 부위(얼굴, 손등, 팔, 다리 등)에 위치하고 있습니까?",
        "병변이 가렵거나 때때로 통증이 있습니까?",
        "병변이 출혈하거나 쉽게 상처를 입습니까?",
        "병변의 가장자리가 불규칙하거나 모호하게 보입니까?"
      ],
      imagePath: 'images/4_양성각화유사병변_2.jpg',
    ),
    QuestionClass(
      className: '습진',
      questions: [
        "피부가 매우 건조하고 가끔 갈라지나요?",
        "피부에 가려운 붉은 발진이 있나요?",
        "발진 부위를 긁으면 피부 상태가 더 악화되나요?",
        "가려움증이 밤에 더 심해지나요?",
        "피부에 작은 수포 또는 짓무름이 생기나요?",
        "습진이 팔꿈치, 무릎 뒤, 목 또는 얼굴과 같은 특정 부위에 주로 나타나나요?",
        "가족 중에 습진, 알레르기 또는 천식을 앓은 사람이 있나요?",
        "피부 발진이 스트레스를 받았을 때 또는 특정 물질에 접촉하면 악화되나요?",
        "피부에 반복적으로 발생하는 발진이나 염증이 있나요?",
        "피부 감염을 자주 경험하나요?"
      ],
      imagePath: 'images/5_습진_2.jpg',
    ),
    QuestionClass(
      className: '흑색종암',
      questions: [
        "피부에 새로운 점이 생겼나요, 또는 기존의 점에서 변화가 있었나요?",
        "모양이 비대칭인 점이 있나요? (한쪽 절반이 다른 쪽과 다르게 보임)",
        "점의 가장자리가 불규칙하거나 흐릿하나요?",
        "점의 색상이 균일하지 않고 여러 색으로 이루어져 있나요?",
        "점의 직경이 6mm 이상으로 커졌나요? (지우개 끝보다 큰 크기)",
        "점이 시간이 지남에 따라 크기, 모양, 색상 또는 높이에서 변화하고 있나요?",
        "점에서 통증이 있거나 가려움, 출혈, 딱지가 생기나요?",
        "피부의 상처가 잘 아물지 않고 지속적으로 문제를 일으키나요?",
        "점이 부드럽거나 경계가 명확하지 않은 상태로 변했나요?",
        "가족 중에 흑색종 또는 다른 형태의 피부암 병력이 있나요?"
      ],
      imagePath: 'images/6_흑색종_2.jpg',
    ),
    QuestionClass(
      className: '건선',
      questions: [
        "피부에 붉고, 두꺼운, 비늘 모양의 각질이 있나요?",
        "이 각질들이 주로 무릎, 팔꿈치, 두피, 등 부위에 나타나나요?",
        "피부의 해당 부위가 가렵거나, 때때로 아프나요?",
        "피부 변화가 스트레스를 받을 때 더 악화되나요?",
        "가족 중에 건선을 앓은 사람이 있나요?",
        "건선을 제거하려고 하면, 해당 부위에서 출혈이 일어나나요? (Auspitz sign)",
        "피부 각질이 갑자기 시작되거나 심해지는 경험을 했나요?",
        "피부 변화로 인해 일상 생활이나 자신감에 영향을 받았나요?",
        "감기나 다른 감염 후 피부 증상이 시작되거나 악화되었나요?",
        "관절에 통증이나 부기가 있고, 이것이 건선과 관련되어 있다고 생각되나요?"
      ],
      imagePath: 'images/7_건선_2.jpg',
    ),
    QuestionClass(
      className: '평편 태선',
      questions: [
        "피부에 평평하고 비늘 모양의 발진이 있습니까?",
        "발진 부위가 가렵거나 타는 듯한 느낌이 있습니까?",
        "발진이 등, 손목, 하복부 또는 하체에 나타났습니까?",
        "발진 부위의 피부가 주변 피부보다 붉거나 어둡습니까?",
        "발진이 몇 주 또는 몇 달 동안 지속되었습니까?",
        "발진 부위에 긁힌 자국이나 피부 손상이 있습니까?",
        "발진이 스트레스를 받았을 때 악화되나요?",
        "가족 중에 비슷한 피부 문제를 가진 사람이 있습니까?",
        "최근에 새로운 약을 복용하기 시작했거나 기존의 약을 변경했습니까?",
        "발진 부위가 햇볕에 노출된 후 악화되었습니까?"
      ],
      imagePath: 'images/8_평편태선_2.jpg',
    ),
    QuestionClass(
      className: '지루성 각화증',
      questions: [
        "피부에 둥글고, 약간 돌출된 병변이 있나요?",
        "이 병변 갈색, 검은색, 또는 피부색과 비슷한 색을 가지고 있나요?",
        "병변의 표면이 거칠고, 비늘처럼 보이나요?",
        "병변이 가슴, 등, 목, 두피 또는 얼굴 등에 주로 위치하고 있나요?",
        "병변에 통증이나 가려움증이 거의 없나요?",
        "병변의 크기가 시간이 지남에 따라 점진적으로 커지고 있나요?",
        "병변의 가장자리가 명확하게 구분되어 있나요?",
        "여러 개의 병변이 나타났나요?",
        "병변이 왁스 같은 느낌을 주거나 지방 같은 느낌이 나나요?",
        "가족 중에 비슷한 피부 병변을 가진 사람이 있나요?"
      ],
      imagePath: 'images/9_지루성각화증_2.jpg',
    ),
    QuestionClass(
      className: '백선사상균, 칸디다증 및 기타 곰팡이 감염',
      questions: [
        "피부에 가려운 붉은 발진이 나타났나요?",
        "발진 부위에 둥근 가장자리가 있고, 중앙이 약간 깨끗해 보이나요? (특히 백선사상균 감염의 경우)",
        "발진 부위가 점차 확장되고 있나요?",
        "발진이 있는 피부가 벗겨지거나, 작은 물집이 생기나요?",
        "습한 부위에 발진이 주로 나타나나요? (예: 사타구니, 겨드랑이, 발가락 사이)",
        "피부 감염 부위가 악취를 동반하나요?",
        "손톱이나 발톱이 두꺼워지고, 색이 변하거나 부서지기 쉬운가요?",
        "구강 내부, 목, 또는 성기 주변에 통증이나 가려움을 동반한 백색 또는 붉은 발진이 있나요? (특히 칸디다증의 경우)",
        "최근에 항생제를 복용했거나, 면역 체계가 약화되었나요?",
        "발진 부위를 청결하고 건조하게 유지하려 해도 증상이 개선되지 않나요?"
      ],
      imagePath: 'images/10_백선_칸디다증_2.jpg',
    ),
    QuestionClass(
      className: '사마귀, 멜러스컴 및 기타 바이러스 감염',
      questions: [
        "피부에 돌기나 융기가 나타났나요?",
        "이 돌기들이 거칠고, 사마귀처럼 보이나요? (특히 사마귀의 경우)",
        "피부에 작고 단단한, 진주 같은 결절이 나타났나요? (특히 멜러스컴의 경우)",
        "결절이나 돌기에 가운데 함몰 또는 압출 시 하얀색 물질이 나오나요? (멜러스컴)",
        "감염 부위가 여러 개이고, 접촉에 의해 쉽게 퍼질 수 있나요?",
        "감염 부위가 가렵거나 통증이 있나요?",
        "사마귀나 결절이 손, 발, 무릎, 팔꿈치 등에 주로 위치하나요?",
        "피부 감염이 몇 주 내지 몇 달 동안 지속되나요?",
        "피부 감염 부위를 가리면서 일상생활에 불편함을 느끼나요?",
        "감염 부위 주변에 비슷한 새로운 감염이 나타나고 있나요?"
      ],
      imagePath: 'images/11_사마귀_멜리스컴_2.jpg',
    ),
  ];
  Map<String, List<Map<String, int>>> userChoices = {};

  @override
  void initState() {
    super.initState();
    allClasses.forEach((qClass) {
      userChoices[qClass.className] = List.generate(
        qClass.questions.length,
        (_) => {'O': 0, 'X': 0},
      );
    });
  }

  void recordAnswer(String className, String answer, int questionIndex) {
    setState(() {
      var currentClassChoices = userChoices[className]!;
      var currentQuestionChoices = currentClassChoices[questionIndex];

      // 'O' 또는 'X' 선택을 취소하고 새로운 선택을 기록합니다.
      currentQuestionChoices['O'] = 0;
      currentQuestionChoices['X'] = 0;
      currentQuestionChoices[answer] = 1;
    });
  }

  void goToPreviousClass() {
    if (currentClassIndex > 0) {
      setState(() {
        currentClassIndex--;
      });
    }
  }

  void goToNextClass() {
    if (currentClassIndex < allClasses.length - 1) {
      setState(() {
        currentClassIndex++;
      });
    } else {
      showResultsDialog(context);
    }
  }

  void showResultsDialog(BuildContext context) {
    final currentClass = allClasses[currentClassIndex];
    final currentChoices = userChoices[currentClass.className]!;

    // 'O'와 'X'의 총계를 계산합니다.
    int yesCount = 0;
    int noCount = 0;
    for (var choices in currentChoices) {
      yesCount += choices['O']!;
      noCount += choices['X']!;
    }

    // 결과 다이얼로그를 표시합니다.
    showDialog(
      context: context,
      useRootNavigator: true,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color(0xFFE7E1DE),
          title: Text(
            '${currentClass.className} 결과',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
              color: Colors.black
            ),
          ),
          content: SingleChildScrollView(
            // 내용이 길어질 경우 스크롤을 가능하게 합니다.
            child: ListBody(
              children: <Widget>[
                Text('예: $yesCount\n아니오: $noCount',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500
                    )
                ),
                SizedBox(height: 16),
                Text(
                    '주변의 병원 위치를 보고싶으신가요?\n아래 버튼을 눌러주세요!',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold

                    )
                ),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                // 버튼이 눌렸을 때 실행될 코드
                Navigator.pushNamed(context, '/nine');
              },
              child: Text(
                '내 주변 병원 위치보기',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFAA9788), // 버튼의 배경색 변경
                foregroundColor: Colors.white, // 버튼의 전경색(텍스트) 변경
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(width: 10,),
            TextButton(
              child: Text(
                '닫기',
                style: TextStyle(

                  color: Colors.black
                ), // 버튼의 텍스트 색상 변경
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestions = allClasses[currentClassIndex].questions;
    final className = allClasses[currentClassIndex].className;
    final currentClass = allClasses[currentClassIndex];
    final imagePath = currentClass.imagePath;

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double imageWidth = screenWidth * 0.9;
    double imageHeight = screenHeight * 0.25;

    return Scaffold(
      backgroundColor: Color(0xFFE7E1DE),
      appBar: CustomAppBar(
          titleText: "예상 피부병 체크",
          onBackPressed: () {
            Navigator.pop(context);
          },
          onSettingPressed: () {
            Navigator.pushNamed(context, '/six');
          }),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isImageVisible = !isImageVisible;
              });
            },
            child: Container(
              width: imageWidth,
              height: imageHeight,
              color: isImageVisible ? Colors.transparent : Color(0xFFAA9788),
              child: isImageVisible
                  ? Image.asset(imagePath)
                  : Center(
                    child: Text(
                      'Click to check the image!',
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        color: Colors.black
                      ),
                    ),
              )
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // "이전" 클래스로 이동하는 버튼, 첫 번째 클래스가 아닐 때만 표시
              if (currentClassIndex > 0)
                IconButton(
                    onPressed: goToPreviousClass,
                    icon: Icon(
                      Icons.chevron_left, size: 32,
                    )
                ),
              Spacer(),
              // "다음" 클래스로 이동하는 버튼, 마지막 클래스가 아닐 때만 표시
              if (currentClassIndex < allClasses.length - 1)
                IconButton(
                    onPressed: goToNextClass,
                    icon: Icon(
                      Icons.chevron_right, size: 32,
                    )
                )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 22, right: 22, bottom: 16),
            child: Text(
              '위에 버튼을 누르면 피부 병변 예시 사진이 나옵니다.\n예시 사진을 보고 자신의 피부 병변과 비슷하다면 아래 체크리스트를 실행해주세요.',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
                color: Colors.black
              ),
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: currentQuestions.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.white,
                      margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                      child: ListTile(
                        title: Text(currentQuestions[index],
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(horizontal: 1),
                                  backgroundColor:
                                  userChoices[className]![index]['O'] == 1
                                      ? const Color.fromARGB(255, 235, 235, 235)
                                      : Colors.white,
                                  foregroundColor: Color(0xFFAA9788),
                                  shape: CircleBorder(),
                              ),
                              onPressed: () => recordAnswer(className, 'O', index),
                              child: Text('O'),
                            ),
                            SizedBox(width: 5),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(horizontal: 1),
                                  backgroundColor:
                                  userChoices[className]![index]['X'] == 1
                                      ? const Color.fromARGB(255, 235, 235, 235)
                                      : Colors.white,
                                  foregroundColor: Color(0xFFAA9788),
                                  shape: CircleBorder()),
                              onPressed: () => recordAnswer(className, 'X', index),
                              child: Text('X'),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
              ),
          ),
          Container(
            padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 35),
            child: ElevatedButton(
              onPressed: () => showResultsDialog(context),
              child: Text(
                  '결과 값 확인하기',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  )
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFAA9788),
                  foregroundColor: Colors.white,
                  minimumSize: Size(430, 72),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  )
              ),
            ),
          ),
        ],
      )
    );
  }
}