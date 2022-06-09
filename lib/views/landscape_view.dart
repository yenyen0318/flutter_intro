import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/custom_gradient_item.dart';


class LandscapePage extends StatefulWidget {
  const LandscapePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<LandscapePage> createState() => _LandscapePageState();
}

class _LandscapePageState extends State<LandscapePage> {

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }
  
  @override
  dispose(){
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  GradientAppBar(
        gradientColors: const [Color.fromARGB(255, 106, 131, 176),Color.fromRGBO(199, 136, 157, 1)],
        text: widget.title,
      ),
      body: const Center(
        child: Text('強制橫屏')
      ),
    );
  }

}