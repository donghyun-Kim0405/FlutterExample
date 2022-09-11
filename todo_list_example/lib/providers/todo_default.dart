import '../models/todo.dart';

class TodoDefault{
  List<Todo> dummyDatas = [
    Todo(id:1, title:'더미 타이틀 1', description: "더미 디스크립션 1"),
    Todo(id:1, title:'더미 타이틀 2', description: "더미 디스크립션 2"),
    Todo(id:1, title:'더미 타이틀 3', description: "더미 디스크립션 3"),
    Todo(id:1, title:'더미 타이틀 4', description: "더미 디스크립션 4"),
    Todo(id:1, title:'더미 타이틀 5', description: "더미 디스크립션 5"),
  ];

  List<Todo> getDummyData(){
    return dummyDatas;
  }

  Todo getDummy(int id) {
    return dummyDatas[id];
  }

  Todo addTodo(Todo todo) {
    Todo newTodo = Todo(
      id: dummyDatas.length+1,
      title: todo.title,
      description: todo.description
    );
    dummyDatas.add(newTodo);
    return newTodo;
  }

  void deleteTodo(int id) {
    for(int i = 0; i < dummyDatas.length; i++) {
      if(dummyDatas[i].id == id) {
        dummyDatas.removeAt(i);
      }
    }
  }

  void updateTodo(Todo todo){
    for(int i = 0; i < dummyDatas.length; i++) {
      if(dummyDatas[i].id == todo.id) {
        dummyDatas[i] = todo;
      }
    }
  }

}