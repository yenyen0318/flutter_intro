import 'package:flutter/material.dart';
import 'package:intro/widgets/drag.dart';


class DragPlayPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DragPlayPageState();
}

class DragPlayPageState extends State<DragPlayPage> with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
            child: StatefulDragArea(
              child: Text('drag and resized me'),
          ),)
          
        ],
      ),
    );
  }
}