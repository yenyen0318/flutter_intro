import 'package:flutter/material.dart';

class StatefulDragArea extends StatefulWidget {
  final Widget child;
  final Color backgroundColor; //可拖曳區塊背景色
  final Function? onDragEnd; //拖曳結束事件

  const StatefulDragArea({
    Key? key, 
    required this.child, 
    this.backgroundColor = Colors.yellow,
    this.onDragEnd,
  }) : super(key: key);

  @override
  _DragAreaStateStateful createState() => _DragAreaStateStateful();
}

class _DragAreaStateStateful extends State<StatefulDragArea> {
  Offset position = Offset(100, 100);
  double prevScale = 1;
  double scale = 1;

  void updateScale(double zoom) => setState(() => scale = prevScale * zoom);
  void commitScale() => setState(() => prevScale = scale);
  void updatePosition(Offset newPosition) =>
      setState(() => position = newPosition);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onScaleUpdate: (details) => updateScale(details.scale),
      onScaleEnd: (_) => commitScale(),
      child: Stack(
        children: [
          Positioned.fill(
              child: Container(color: widget.backgroundColor)),
          Positioned(
            left: position.dx,
            top: position.dy,
            child: Draggable(
              maxSimultaneousDrags: 1,
              feedback: widget.child,
              childWhenDragging: Opacity(
                opacity: .3,
                child: widget.child,
              ),
              onDragEnd: (details){
                updatePosition(details.offset);
                widget.onDragEnd!(details);
              },
              child: Transform.scale(
                scale: scale,
                child: widget.child,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
