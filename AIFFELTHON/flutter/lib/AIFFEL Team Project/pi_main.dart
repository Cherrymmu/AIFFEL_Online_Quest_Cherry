import 'package:flutter/material.dart';

class PiApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      home: Scaffold(

        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/picture-1.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.75),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0.5 * screenWidth - 0.5 * 163,
              top: 0.79 * screenHeight,
              child: Container(
                width: 163,
                height: 75.5,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/brandlogoFrame.png'),
                        fit: BoxFit.fill
                    )
                ),
              ),
            ),
            Positioned(
                left: 0,
                right: 0,
                top: 0.89 * screenHeight,
                child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, '/two');
                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(430, 72),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)
                        ),
                    ),
                    child: Text(
                      '시작하기',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFAA9788),
                      ),
                    ),
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}
