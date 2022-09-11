import 'package:fluttertoast/fluttertoast.dart';
import 'package:sqflite/sqflite.dart';

import '../models/todo.dart';

class TodoSqlite{
  late Database db;

  Future initDB() async{
    // MissingPluginError 발생시 앱 중지/ 앱 삭제 후 다시 빌드
    db = await openDatabase('my_db.db');

    String query = 'CREATE TABLE IF NOT EXISTS MyTodo (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, title TEXT, description TEXT)';


    //만약 기존에 생성한 테이블이 없다면 테이블 생성
    await db.execute(query);
  }//initDB()

  Future<List<Todo>> getTodos() async{
    List<Todo> todos = [];
    List<Map> maps = await db.query('MyTodo', columns: ['id', 'title', 'description']);
    maps.forEach((mapElement) {
      todos.add(Todo.fromMap(mapElement));
    });
    return todos;
  }// getTodos()

  Future<Todo?> getTodo(int id) async {
    List<Map> map = await db.query(
      'MyTodo',
      columns: ['id', 'title', 'description'],
      where: 'id = ?',
      whereArgs: [id]
    );

    if(map.length >0) {
      return Todo.fromMap(map[0]);
    }
  }//getTodo()

  Future addTodo(Todo todo) async{
    int id = await db.insert('MyTodo', todo.toMap());
  }

  Future deleteTodo(int id) async {
    Fluttertoast.showToast(msg: id.toString());
    await db.delete('MyTodo', where: 'id = ?', whereArgs: [id]);
  }

  Future updateTodo(Todo todo) async {
    await db.update('MyTodo', todo.toMap(), where: 'id = ?', whereArgs: [todo.id]);
  }
}