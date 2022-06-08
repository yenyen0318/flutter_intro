
import 'package:flutter/material.dart';

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