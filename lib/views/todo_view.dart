import 'package:flutter/material.dart';
import '../database/TodoDB.dart';
import '../model/todo.dart';
import '../widgets/custom_gradient_item.dart';
import 'todo_upsert_view.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  late List<Todo> _todos = <Todo>[];

  @override
  void initState() {
    super.initState();
    _getTodoList();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: GradientAppBar(
            gradientColors: const [
              Color.fromARGB(255, 106, 131, 176),
              Color.fromRGBO(199, 136, 157, 1)
            ],
            text: widget.title,
            actions: [
              IconButton(
                  onPressed: () {
                    _deleteAllTodoList();
                  },
                  icon: const Icon(Icons.delete))
            ],
          ),
          body: Center(
            child: ListView(
              children: _todos.map((Todo todo) {
                return TodoItem(
                  todo: todo,
                  onTodoFinish: _handleTodoChange,
                  onStarChanged: _handleStarChange,
                  onTodoDelete: _handleTodoDelete,
                  onTodoEdit: () {
                    _showTodoItemBottomSheet(todo, TodoActionType.update);
                  },
                );
              }).toList(),
            ),
          ),
          floatingActionButton: GradientFloatingActionButton(
            icon: const Icon(
              Icons.add,
            ),
            gradientColors: const [
              Color.fromARGB(255, 106, 131, 176),
              Color.fromRGBO(199, 136, 157, 1)
            ],
            onPressed: () {
              _showTodoItemBottomSheet(null, TodoActionType.insert);
            },
          )),
    );
  }

  void _handleTodoChange(Todo item) async {
    final updateItem = Todo(
        id: item.id,
        title: item.title,
        detail: item.detail,
        top: item.top,
        isfinish: !item.isfinish,
        endDate: item.endDate);
    await TodoDB.updateTodo(updateItem);
    _getTodoList();
  }

  void _handleTodoDelete(Todo item) async {
    await TodoDB.deleteTodo(item.id);
    _getTodoList();
  }

  void _handleStarChange(Todo item) async {
    final updateItem = Todo(
        id: item.id,
        title: item.title,
        detail: item.detail,
        top: !item.top,
        isfinish: item.isfinish,
        endDate: item.endDate);
    await TodoDB.updateTodo(updateItem);
    _getTodoList();
  }

  void _addTodoItem(Todo item) async {
    await TodoDB.addTodo(item);
    _getTodoList();
  }

  void _updateTodoItem(Todo item) async {
    await TodoDB.updateTodo(item);
    _getTodoList();
  }

  void _showTodoItemBottomSheet(Todo? item, TodoActionType type) async {
    return showModalBottomSheet<Todo>(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return UpsertTodoList(defaultItem: item ?? Todo());
      },
    ).then((Todo? item) {
      if (item != null) {
        switch (type) {
          case TodoActionType.insert:
            _addTodoItem(item);
            break;
          case TodoActionType.update:
            _updateTodoItem(item);
            break;
        }
      }
    });
  }

  // 查所有list
  void _getTodoList() async {
    final list = await TodoDB.getTodos();
    setState(() {
      _todos = list;
    });
  }

  void _deleteAllTodoList() async {
    await TodoDB.deleteAllTodo();
    setState(() {
      _todos = [];
    });
  }
}
