import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_arc_text/flutter_arc_text.dart';
import 'package:intro/widgets/custom_theme.dart';

class CircleInfo extends StatelessWidget {
  final double textRadius;  //文字角度
  final Color? textColor;    //文字顏色
  final String infoText;    //按鈕上數字顏色
  final double fontSize;

  const CircleInfo({
    Key? key,
    this.textRadius = 100,
    this.textColor,
    this.infoText = 'Hello, my name is Yen Yen! Welcome to my App.',
    this.fontSize = 18
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return //自介圖片
        CircleAvatar(
      radius: 86.0,
      backgroundImage: AssetImage('assets/images/cat.jpg'),
      backgroundColor: Colors.transparent,
      child: ArcText(
        radius: textRadius,
        text: infoText,
        textStyle: TextStyle(
            fontSize: fontSize,
            color: textColor ?? Theme.of(context).colorScheme.ArcInfoTextColor),
        startAngle: -pi / 3,
      ),
    );
  }
}
