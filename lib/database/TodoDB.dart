import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Todo {
  final int? id;
  final String title;
  final String detail;
  final bool isfinish;
  final bool top;
  final DateTime? endDate;

  Todo(
      {this.id, //編號
      this.title = '', //標題
      this.detail = '', //詳細資訊
      this.top = false, //置頂
      this.isfinish = false, //是否完成
      this.endDate //完成日期
      });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'title': title,
      'detail': detail,
      'top': top ? 1 : 0,
      'isfinish': isfinish ? 1 : 0,
      'endDate': endDate.toString()
    };

    if (id != null) map['id'] = id;
    return map;
  }
}

class TodoDB {
  static Database? _database;

  //若發現_database 為 null 則進行 _initiateDatabase()
  static Future<Database> get database async =>
      _database ??= await _initiateDatabase();

  //建立todos資料表
  static Future<Database> _initiateDatabase() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'todo.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE todos(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, title TEXT, detail TEXT, top INTEGER, isfinish INTEGER, endDate INTEGER)",
        );
      },
      version: 1,
    );
    return database;
  }

  //取得todos內容
  static Future<List<Todo>> getTodos() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.rawQuery(
        'SELECT id, title, detail, isfinish, top, endDate FROM todos ORDER BY isfinish ASC, top DESC');

    return List.generate(maps.length, (i) {
      return Todo(
        id: maps[i]['id'],
        title: maps[i]['title'],
        detail: maps[i]['detail'],
        isfinish: maps[i]['isfinish'] == 1,
        top: maps[i]['top'] == 1,
        endDate: DateFormat('yyyy-MM-dd').parse(maps[i]['endDate']),
      );
    });
  }

  //新增
  static Future<void> addTodo(Todo todo) async {
    final Database db = await database;
    await db.insert(
      'todos',
      todo.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  //修改
  static Future<void> updateTodo(Todo todo) async {
    final Database db = await database;
    await db.update(
      'todos',
      todo.toMap(),
      where: "id = ?",
      whereArgs: [todo.id],
    );
  }

  //刪除
  static Future<void> deleteTodo(int? id) async {
    final Database db = await database;
    await db.delete(
      'todos',
      where: "id = ?",
      whereArgs: [id],
    );
  }

  static Future<void> deleteAllTodo() async {
    final Database db = await database;
    await db.execute("DROP TABLE IF EXISTS todos");
    await db.execute(
        "CREATE TABLE todos(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, title TEXT, detail TEXT, top INTEGER, isfinish INTEGER, endDate INTEGER)");
  }
}
