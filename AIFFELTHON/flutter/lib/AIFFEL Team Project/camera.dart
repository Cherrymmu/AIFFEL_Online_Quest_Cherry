import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'CustomAppBar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'Pibuanchat.dart';
import 'dart:io';

class Camera extends StatefulWidget {
  const Camera({Key? key}) : super(key: key);

  @override
  _CameraState createState() => _CameraState();
}
class _CameraState extends State<Camera> {
  XFile? _image;
  List? _outputs;

  @override
  void initState() {
    super.initState();
    loadModel().then((value) {
      setState(() {});
    });
  }

  loadModel() async {
    await Tflite.loadModel(
      model: "assets/model.tflite",
      labels: "assets/labels.txt",
    ).then((value) {
      setState(() {});
    });
  }

  Future<void> getGalleryImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
    await classifyImage(XFile(image!.path));
  }

  Future<void> getCameraImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.camera);
      setState(() {
        _image = XFile(image!.path);
      });
  }

  Future classifyImage(XFile image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 3,
      threshold: 0.1,
      asynch: true
    );
    print(output);
    setState(() {
      _outputs = output;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFE7E1DE),
        appBar: CustomAppBar(
          titleText: '사진 촬영',
          onBackPressed: () {
            Navigator.pop(context);
          },
          onSettingPressed: () {
            Navigator.pushNamed(context, '/six');
          },
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  '피부에 고민 있어? 그럼 사진 한번 찍어봐😉',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    color: Colors.black
                  ),
                ),
                SizedBox(height: 25.0),
                ElevatedButton(
                    onPressed: () {
                      getGalleryImage();
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(430, 72),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      backgroundColor: Color(0xFFFFFFFF)
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.photo,
                          color: Colors.black,
                          size: 30.0,
                        ),
                        SizedBox(width: 10.0),
                        Text(
                          '갤러리에서 선택',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            color: Colors.black
                          ),
                        )
                      ],
                    )
                ),
                SizedBox(height: 45.0),
                Material(
                  color: Colors.transparent, // Material 위젯의 배경색을 투명하게 설정
                  shape: CircleBorder(), // Material의 모양을 원형으로 설정
                  child: InkWell(
                    customBorder: CircleBorder(), // InkWell의 터치 효과 또한 원형으로 설정
                    onTap: () {
                      getCameraImage();
                    },
                    child: Container(
                      width: 440.0, // 원하는 버튼의 너비
                      height: 400.0, // 원하는 버튼의 높이
                      decoration: BoxDecoration(
                        shape: BoxShape.circle, // 컨테이너를 원형으로 만듦
                        color: Color(0xFFFFFFFF).withOpacity(0.35), // 배경 색상, 필요에 따라 조정
                      ),
                      child: _image == null
                          ? Center(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.add_a_photo,
                                  color: Colors.black,
                                ),
                                SizedBox(width: 10.0),
                                Text(
                                  '사진을 촬영하세요.',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                          ],
                        )
                      )
                          : ClipOval(
                              child: Image.file(
                                File(_image!.path),
                                fit: BoxFit.cover, // 이미지를 커버 모드로 설정
                                width: 440.0, // 이미지의 너비
                                height: 400.0, // 이미지의 높이
                          ),
                        ),
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.only(bottom: 35.0),
                  child: ElevatedButton(
                    onPressed: _outputs != null && _outputs!.isNotEmpty ?() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChatScreen(results: _outputs))
                      );
                      setState(() {});
                    } : null,
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(430, 72),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)
                      ),
                      backgroundColor: Color(0xFFAA9788)
                    ),
                    child: Text(
                      '촬영확인',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFFFFFF)
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ),
    );
  }

  Widget showImage() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 10, left: 10, right: 10),
          height: 250,
          width: 250,
          decoration: BoxDecoration(
            color: const Color(0xFFE7E1DE),
            borderRadius: BorderRadius.circular(20.0)
          ),
          child: Center(
            child: _image == null
                ? Text('No image selected.')
                : Image.file(
                    File(_image!.path),
                    fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 20),
        _outputs != null
            ? Column(
          children: List.generate(
            _outputs!.length,
                (index) => Text( // 모델 결과 출력
              '${_outputs![index]['label']} : ${((_outputs![index]['confidence'] as double) * 100).toStringAsFixed(0)}%',
              style: TextStyle(
                fontSize: 16.0,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500
              ),
            ),
          ),
        )
            : Container(),
      ],
    );
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }
}