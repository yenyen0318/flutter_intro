import 'package:flutter/material.dart';
import 'package:intro/model/intro_pages.dart';
import 'package:provider/provider.dart';

import '../navigation/app_state_manager.dart';
import '../widgets/circleInfo.dart';

class SplashPage extends StatefulWidget {
  static MaterialPage page() {
    debugPrint('SplashPage');
    return MaterialPage(
      name: IntroPages.splashPath,
      key: ValueKey(IntroPages.splashPath),
      child: const SplashPage(),
    );
  }

  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<AppStateManager>(context, listen: false).initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(100.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CircleInfo(),
            LinearProgressIndicator(
              backgroundColor: Colors.black12,
              color: Theme.of(context).progressIndicatorTheme.color,
              semanticsLabel: 'Init...',
            ),
          ],
        ),
      ),
    );
  }
}
