import 'package:flutter/material.dart';

class GradientAppBar extends StatelessWidget with PreferredSizeWidget{
  const GradientAppBar({
    Key? key,
    required this.gradientColors, 
    required this.text,
  }) : super(key: key);

  final List<Color> gradientColors;
  final String text;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text(text),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color.fromARGB(255, 106, 131, 176),Color.fromRGBO(199, 136, 157, 1)],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter
              )
          ),
        ),
      );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}