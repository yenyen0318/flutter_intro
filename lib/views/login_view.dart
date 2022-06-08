import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_arc_text/flutter_arc_text.dart';
import 'package:intro/main.dart';
import 'package:intro/widgets/custom_num_pad.dart';
import 'package:intro/widgets/gradient_border.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final _pinCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.bottomCenter,
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            //自介圖片
            const CircleAvatar(
              radius: 86.0,
              backgroundImage:
                  AssetImage('assets/images/cat.jpg'),
              backgroundColor: Colors.transparent,
              child: ArcText(
                radius: 100,
                text: 'Hello, my name is Yen Yen! Welcome to my App.',
                textStyle: TextStyle(fontSize: 18, color: Colors.black),
                startAngle: -pi / 3,
              ),
            ),

            const SizedBox(height: 50),

            //輸入框
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: SizedBox(
                height: 70,
                child: Center(
                    child: TextField(
                    controller: _pinCodeController,
                    textAlign: TextAlign.center,
                    showCursor: false,
                    maxLength: 4,
                    maxLines: 1,
                    autofocus: true,
                    keyboardType: TextInputType.none,
                    style: const TextStyle(
                      fontSize: 40, 
                      color: Colors.black54,
                      letterSpacing: 10.0, //文字間距
                    ),
                    decoration: const InputDecoration(  
                      counterText: '',      
                      focusedBorder: UnderlineInputBorder(
                        borderSide: GradientBorderSide(
                          colors: [Color.fromARGB(255, 106, 131, 176),Color.fromRGBO(199, 136, 157, 1)],
                          borderWidth: 2,
                        ),
                      ),  
                    ),
                  )
                ),
              ),
            ),

            const SizedBox(height: 40),

            //客製鍵盤
            NumPad(
              buttonSize: 70,
              backgroundColor:  const [Color.fromARGB(255, 106, 131, 176),Color.fromRGBO(199, 136, 157, 1),],
              iconColor: Colors.white,
              numController: _pinCodeController,
              onDelete: () {
                _pinCodeController.text = _pinCodeController.text
                    .substring(0, _pinCodeController.text.length - 1);
              },
              onSubmit: () {
                debugPrint('Your code: ${_pinCodeController.text}');
                if(_pinCodeController.text == '0519'){
                  _pinCodeController.text = '';
                  Navigator.pushReplacement(  //點擊自帶返回建直接跳出APP
                    context,
                    MaterialPageRoute(builder: (context) => const MyHomePage()),
                  ); 
                } else {
                  _pinCodeController.text = '';
                  showDialog(
                    context: context,
                    barrierDismissible: true, //點擊對話框是否遮蔽
                    builder: (BuildContext context) {
                      return const Center(
                          child: Text("ERROR"),
                      );
                    }
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}