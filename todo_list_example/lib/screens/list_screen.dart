import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo_list_example/providers/todo_default.dart';
import 'package:todo_list_example/providers/todo_firebase.dart';
import 'package:todo_list_example/repositorys/TodoSqlite.dart';
import 'package:todo_list_example/screens/news_screen.dart';

import '../models/todo.dart';
import '../utils/dialog_util.dart';


class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<Todo> todos = [];
  bool isLoading = true;
  TodoSqlite todoSqlite = TodoSqlite();
  TodoFirebase todoFirebase = TodoFirebase();



  Future initDB() async {
    await todoSqlite.initDB().then((value) async{
      todos = await todoSqlite.getTodos();
    });
  }

  @override
  void initState() {
    super.initState();
    Fluttertoast.showToast(msg: "initState");
    print("initState");
    /*Timer(Duration(seconds: 2), (){
      initDB().then((_){
        setState(() {
          isLoading = false;
        });
      });

    });*/
    setState(() {
      todoFirebase.initDB();
    });
  }

  @override
  Widget build(BuildContext context) {

    return StreamBuilder<QuerySnapshot>(
      stream: todoFirebase.todoStream,
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if(!snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }else{
          todos = todoFirebase.getTodos(snapshot);
          return Scaffold(
              appBar: AppBar(
                title: Text('할 일 목록 앱'),
                actions: [
                  MyInkwell()
                ],
              ),

              floatingActionButton: MyFloatingButton(todoSqlite, this, todos, (List<Todo> _todos){
                setState(() {
                  todos = _todos;
                });
              }, todoFirebase),

              body: MyContentWidget(todoSqlite, this, todos, (List<Todo> _todos){
                setState(() {
                  todos = _todos;
                });
              }, todoFirebase)
          );
        }


      }
    );
  }
}


class MyInkwell extends StatelessWidget {
  const MyInkwell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {



    return InkWell(
      onTap: (){

      },
      child: Container(
        padding: EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(onPressed: (){
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => NewsScreen()));
            }, icon: Icon(Icons.book)),

            Text('뉴스')
          ],
        ),
      )
    );
  }
}

class MyFloatingButton extends StatelessWidget {
  TodoSqlite todoSqlite;
  State state;
  List<Todo> todos;
  TodoUpdated callback;
  TodoFirebase todoFirebase;

  MyFloatingButton(this.todoSqlite, this.state, this.todos, this.callback, this.todoFirebase);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: (){
        DialogUtils.showAddDialog(context, todoSqlite, state, callback, todoFirebase);
      },
      child: Text(
        '+',
        style: TextStyle(
          fontSize: 25
        ),
      ),
    );
  }
}




/**
 *  ListView.seperated -> ListView.builder와 유사하다.
 *  List의 각 요소들 사이에 구분자(Devider)를 넣어준다.
 *  여기서는 기본으로 Devider()를 사용했다.
 * */


class MyContentWidget extends StatelessWidget {
  List<Todo> todos = [];
  TodoSqlite todoSqlite;
  State state;
  TodoUpdated callback;
  TodoFirebase todoFirebase;
  MyContentWidget(this.todoSqlite, this.state, this.todos, this.callback, this.todoFirebase);


  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(todos[index].title),
          onTap: (){
            DialogUtils.showInfoDialog(context, todos[index]);
          },
          trailing: Container(
            width: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  child: InkWell(
                    child: Icon(Icons.edit),
                    onTap: (){
                      DialogUtils.showEditDialog(context, todos[index], todoSqlite, state, callback, todoFirebase);
                    },
                  ),
                ),

                Container(
                  padding: EdgeInsets.all(5),
                  child: InkWell(
                    child: Icon(Icons.delete),
                    onTap: (){
                      DialogUtils.showDeleteDialog(context, todoSqlite, todos[index], callback, todoFirebase);
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index){
        return Divider();
      },
    );
  }
}


