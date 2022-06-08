import 'package:flutter/material.dart';

class NumPad extends StatelessWidget {
  final double buttonSize;  //按鈕文字大小
  final Color buttonColor;  //按鈕顏色
  final Color iconColor;    //非數字按鈕顏色
  final List<Color> backgroundColor;  //鍵盤背景顏色
  final Color shadowColor;  //按鈕陰影顏色
  final double borderRadius; //圓角
  final TextEditingController numController; //輸入框文字
  final Function onDelete;    //刪除事件
  final Function onSubmit;  //送出事件

  const NumPad({
    Key? key,
    this.buttonSize = 70,               
    this.buttonColor = Colors.transparent, 
    this.iconColor = Colors.amber,    
    this.shadowColor = Colors.transparent,
    this.borderRadius = 50,
    required this.backgroundColor, 
    required this.numController, 
    required this.onDelete,   
    required this.onSubmit, 
  }) : super(key: key);

  //設定非數字按鈕大小(與文字一樣會過大)
  double _getIconButtonSize(){
    double iconSize = buttonSize - 24;
    return iconSize >= 24 ? iconSize : 24;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(borderRadius),topRight: Radius.circular(borderRadius)),
          gradient: LinearGradient(
              colors: backgroundColor,
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter
          )
      ),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NumberButton(
                number: 1,
                size: buttonSize,
                color: buttonColor,
                shadowColor: shadowColor,
                controller: numController,
              ),
              NumberButton(
                number: 2,
                size: buttonSize,
                color: buttonColor,
                shadowColor: shadowColor,
                controller: numController,
              ),
              NumberButton(
                number: 3,
                size: buttonSize,
                color: buttonColor,
                shadowColor: shadowColor,
                controller: numController,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NumberButton(
                number: 4,
                size: buttonSize,
                color: buttonColor,
                shadowColor: shadowColor,
                controller: numController,
              ),
              NumberButton(
                number: 5,
                size: buttonSize,
                color: buttonColor,
                shadowColor: shadowColor,
                controller: numController,
              ),
              NumberButton(
                number: 6,
                size: buttonSize,
                color: buttonColor,
                shadowColor: shadowColor,
                controller: numController,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NumberButton(
                number: 7,
                size: buttonSize,
                color: buttonColor,
                shadowColor: shadowColor,
                controller: numController,
              ),
              NumberButton(
                number: 8,
                size: buttonSize,
                color: buttonColor,
                shadowColor: shadowColor,
                controller: numController,
              ),
              NumberButton(
                number: 9,
                size: buttonSize,
                color: buttonColor,
                shadowColor: shadowColor,
                controller: numController,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () => onDelete(),
                icon: Icon(
                  Icons.backspace,
                  color: iconColor,
                ),
                iconSize: _getIconButtonSize(),
              ),
              NumberButton(
                number: 0,
                size: buttonSize,
                color: buttonColor,
                shadowColor: shadowColor,
                controller: numController,
              ),
              IconButton(
                onPressed: () => onSubmit(),
                icon: Icon(
                  Icons.done,
                  color: iconColor,
                ),
                iconSize: _getIconButtonSize(),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class NumberButton extends StatelessWidget {
  final int number;
  final double size;
  final Color color;
  final Color shadowColor; 
  final TextEditingController controller;

  const NumberButton({
    Key? key,
    required this.shadowColor,
    required this.number,
    required this.size,
    required this.color,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shadowColor: shadowColor,
          primary: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(size / 2),
          ),
        ),
        onPressed: () {
          if(controller.text.length <4){
            controller.text += number.toString();
          }
        },
        child: Center(
          child: Text(
            number.toString(),
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30),
          ),
        ),
      ),
    );
  }
}