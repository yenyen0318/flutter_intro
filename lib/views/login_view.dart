import 'package:flutter/material.dart';
import 'package:intro/model/gradient_border.dart';

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
                    keyboardType: TextInputType.number,
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
          ],
        ),
      ),
    );
  }
}