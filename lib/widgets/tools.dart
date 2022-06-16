import 'package:flutter/material.dart';
import 'package:intro/main.dart';
import 'package:intro/widgets/custom_gradient_item.dart';

PreferredSizeWidget SwitchAppBar(String title, List<Widget>? actions) {
  return MyApp.themeNotifier.value == ThemeMode.light
      ? GradientAppBar(gradientColors: [
          Color.fromARGB(255, 106, 131, 176),
          Color.fromRGBO(199, 136, 157, 1)
        ], text: title, actions: actions,)
      : AppBar(title: Text(title));
}
