import 'package:flutter/material.dart';

import '../widgets/circleInfo.dart';

class SplashPage extends StatelessWidget {
  const SplashPage ({ Key? key }) : super(key: key);

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