import 'package:flutter/material.dart';
import 'package:intro/widgets/custom_gradient_item.dart';
import 'package:intro/widgets/custom_num_pad.dart';
import 'package:intro/widgets/custom_theme.dart';
import 'package:provider/provider.dart';

import '../model/intro_pages.dart';
import '../navigation/app_state_manager.dart';
import '../widgets/circleInfo.dart';

class LoginPage extends StatefulWidget {
  static MaterialPage page() {
    debugPrint('LoginPage');
    return MaterialPage(
      name: IntroPages.loginPath,
      key: ValueKey(IntroPages.loginPath),
      child: LoginPage(),
    );
  }

  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _pinCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.bottomCenter,
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            //自介圖片
            CircleInfo(),

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
                  style: TextStyle(
                    fontSize: 40,
                    color: Theme.of(context).colorScheme.numpadInputColor,
                    letterSpacing: 10.0, //文字間距
                  ),
                  decoration: const InputDecoration(
                    counterText: '',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: GradientBorderSide(
                        colors: [
                          Color.fromARGB(255, 106, 131, 176),
                          Color.fromRGBO(199, 136, 157, 1)
                        ],
                        borderWidth: 2,
                      ),
                    ),
                  ),
                )),
              ),
            ),

            const SizedBox(height: 40),

            //客製鍵盤
            NumPad(
              buttonSize: 70,
              backgroundColor: const [
                Color.fromARGB(255, 106, 131, 176),
                Color.fromRGBO(199, 136, 157, 1),
              ],
              numTextColor: Theme.of(context).colorScheme.numpadButtonColor,
              iconColor: Theme.of(context).colorScheme.numpadButtonColor,
              numController: _pinCodeController,
              onDelete: () {
                _pinCodeController.text = _pinCodeController.text
                    .substring(0, _pinCodeController.text.length - 1);
              },
              onSubmit: () {
                debugPrint('Your code: ${_pinCodeController.text}');
                if (_pinCodeController.text == '0519') {
                  _pinCodeController.text = '';
                  Provider.of<AppStateManager>(context, listen: false)
                      .login('mockUsername', 'mockPassword');
                } else {
                  _pinCodeController.text = '';
                  showDialog(
                      context: context,
                      barrierDismissible: true, //點擊對話框是否遮蔽
                      builder: (BuildContext context) {
                        return const Center(
                          child: Text("ERROR"),
                        );
                      });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
