import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo_list_example/providers/todo_default.dart';
import 'package:todo_list_example/providers/todo_firebase.dart';
import 'package:todo_list_example/repositorys/TodoSqlite.dart';

import '../models/todo.dart';


typedef TodoUpdated = Function(List<Todo>);

class DialogUtils {

  static void showAddDialog(BuildContext context, TodoSqlite todoSqlite, State state, TodoUpdated callback, TodoFirebase todoFirebase){

    showDialog(
      context: context,
      builder: (BuildContext context){
        String title = "";
        String description = "";
        return AlertDialog(
          title: Text('할 일 추가하기'),
          content: Container(
            height: 200,
            child: Column(
              children: [
                TextField(
                  onChanged: (value){
                    title = value;
                  },
                  decoration: InputDecoration(labelText: '제목'),
                ),

                TextField(
                  onChanged: (value){
                    description = value;
                  },
                  decoration: InputDecoration(labelText: '설명'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text('추가'),
              onPressed: () async{

                /*await todoSqlite.addTodo(
                  Todo(title: title, description: description),
                );

                var todos = await todoSqlite.getTodos();
                callback(todos);*/

                var newTodo = Todo(title: title, description: description);
                todoFirebase.todosReference
                  .add(newTodo.toMap())
                  .then((_){
                  Navigator.of(context).pop();
                });

              }//onPressed,
            ),

            TextButton(
              child: Text('취소'),
              onPressed: (){
                Navigator.of(context).pop();
              },
            )

          ],
        );
      },

    );
  } //showAddDialog()

  static void showInfoDialog(BuildContext context, Todo todo){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return SimpleDialog(
          title: Text('할 일'),
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Text('제목 : ' + todo.title),
            ),

            Container(
              padding: EdgeInsets.all(10),
              child: Text('설명 : ' + todo.description),
            )
          ],
        );
      }

    );

  }//showInfoDialog()

  static void showEditDialog(BuildContext context, Todo todo, TodoSqlite todoSqlite, State state, TodoUpdated callback, TodoFirebase todoFirebase){
    showDialog(
      context: context,
      builder: (BuildContext context){
        String title = todo.title;
        String description = todo.description;
        return AlertDialog(
          title: Text('할 일 수정하기'),
          content: Column(
            children: [
              TextField(
                onChanged: (value){
                  title = value;
                },
                decoration: InputDecoration(
                  hintText: todo.title,
                ),
              ),


              TextField(
                onChanged: (value){
                  description = value;
                },
                decoration: InputDecoration(
                  hintText: todo.description,
                ),
              )
            ],
          ),
          actions: [
            TextButton(
              child: Text('수정'),
              onPressed: () async {
                Todo newTodo = Todo(
                  id: todo.id,
                  title: title,
                  description: description,
                  reference: todo.reference
                );

                todoFirebase
                  .updateTodo(newTodo)
                  .then((_){
                    Navigator.of(context).pop();
                });


                /*todoSqlite.updateTodo(newTodo);
                var todos = await todoSqlite.getTodos();
                callback(todos);

                Navigator.of(context).pop();*/

              },
            ),

            TextButton(
              child: Text("취소"),
              onPressed: (){
                Navigator.of(context).pop();
              },
            )


          ],
        );

      }
    );

  }//showEditDialog

  static void showDeleteDialog(BuildContext context, TodoSqlite todoSqlite, Todo todo, TodoUpdated callback, TodoFirebase todoFirebase){
    showDialog(
        context: context,
        builder: (BuildContext context){
            return AlertDialog(
              title: Text('할 일 삭제하기'),
              content: Container(
                child: Text('삭제하시겠습니까?'),
              ),
              actions: [
                TextButton(
                  child: Text('삭제'),
                  onPressed: () async{

                    /*await todoSqlite.deleteTodo(todo.id ?? 0);
                    var newTodo = await todoSqlite.getTodos();
                    callback(newTodo);
                    Navigator.of(context).pop();*/
                    todoFirebase
                      .deleteTodo(todo)
                        .then((_){
                          Navigator.of(context).pop();
                    });

                  },
                ),

                TextButton(
                  child: Text('취소'),
                  onPressed: () async{
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          },
    );



  }// showDeleteDialog()



}
