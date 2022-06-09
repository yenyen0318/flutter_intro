import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../database/TodoDB.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  final dynamic onTodoFinish;
  final VoidCallback onTodoEdit;
  final dynamic onTodoDelete;
  final dynamic onStarChanged;

  TodoItem({
    required this.todo,
    required this.onTodoFinish,
    required this.onTodoEdit,
    required this.onTodoDelete,
    required this.onStarChanged,
  }) : super(key: ObjectKey(todo));

  TextStyle? _getTextStyle(bool checked) {
    if (!checked) return null;

    return const TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
        key: const ValueKey(0),
        startActionPane: ActionPane(
          extentRatio: 0.3,       //可滑動寬度
          motion: const DrawerMotion(), //滑動動畫
          dragDismissible: false, //不可滑動超過一定比例
          children: [
            SlidableAction(
              backgroundColor: const Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              onPressed: (context) {
                onTodoDelete(todo);         
              },
            ),
            SlidableAction(
              backgroundColor: Colors.orange,
              foregroundColor: Colors.white,
              icon: Icons.edit,
              onPressed: (context) {
                onTodoEdit();         
              },
            ),
          ],
        ),

        child: CheckboxListTile(
          title:Text(todo.title, style: _getTextStyle(todo.isfinish)),
          subtitle: Text(todo.detail, style: _getTextStyle(todo.isfinish)),
          secondary: IconButton(
            icon: getStarStyle(todo.top),
            splashColor: Colors.transparent,  
            highlightColor: Colors.transparent,
            onPressed: (){
              onStarChanged(todo);
            },
          ),
          autofocus: false,
          selected: todo.isfinish,
          value: todo.isfinish,
          onChanged: (value) {
            onTodoFinish(todo);
          },
        ),
      );
  }
}

Icon getStarStyle(bool top){
return top ? Icon(
      Icons.star,
      color: Colors.yellow[700]
    ) : const Icon(
      Icons.star,
      color: Colors.black54
    );
} 

enum TodoActionType {
  update,
  insert
}