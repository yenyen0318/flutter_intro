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
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors:gradientColors,
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

class GradientText extends StatelessWidget {
  final String text;
  final List<Color> gradientColors;

  const GradientText({
    Key? key,
    required this.text,
    required this.gradientColors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
    text,
    style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          foreground: Paint()..shader =LinearGradient(
                  colors:gradientColors,
              ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 100.0))
        )
    );
  }
}

class GradientBorderSide extends BorderSide {   
  final List<Color> colors;    
  final double borderWidth;
  const GradientBorderSide({required this.colors, required this.borderWidth});    
  
  @override   
  Paint toPaint() => Paint()     
  ..strokeWidth = borderWidth  
  ..shader = LinearGradient(colors: colors).createShader(const Rect.fromLTRB(0, 0, 200, 0)
  ); 
}

class GradientChips extends StatelessWidget {
  final List<String>  items;
  final List<Color> gradientColors;

  const GradientChips({
    Key? key,
    required this.items,
    required this.gradientColors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0,),
      child: Wrap(
            alignment: WrapAlignment.start,
            spacing: 5,
            runSpacing: 5, // to apply margin in the cross axis of the wrap
            children: items.map((item) {
              return GradientChip(text: item, gradientColors: gradientColors);
            }).toList(),
          ),
    );
  }
}

class GradientChip extends StatelessWidget {
  final String text;
  final List<Color> gradientColors;

  const GradientChip({
    Key? key,
    required this.text,
    required this.gradientColors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0), //3像素圆角
              gradient: LinearGradient(
                  colors: gradientColors,
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter
              )
          ),
          child: Padding(
            padding: const EdgeInsets.all(7),
            child: Text(text, style: TextStyle(color: Colors.white),),
          )
      );
  }
}