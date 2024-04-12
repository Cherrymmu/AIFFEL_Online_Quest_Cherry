import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String titleText;
  final Function onBackPressed;
  final Function? onSettingPressed;
  
  CustomAppBar({
    required this.titleText,
    required this.onBackPressed,
    this.onSettingPressed,
});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Color(0xFFE7E1DE),
        toolbarHeight: 60,
        leading: Center(
            child: SizedBox(
              height: 60,
              child: IconButton(
                icon: Icon(
                  CupertinoIcons.back,
                  color: Colors.black,
                  size: 30,
                ),
                onPressed: () => onBackPressed(),
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
                        titleText,
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
            if(onSettingPressed != null)
              IconButton(
                  onPressed: () => onSettingPressed!(),
                  icon: Icon(Icons.settings)
              )
          ],
        )
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(60);
}
