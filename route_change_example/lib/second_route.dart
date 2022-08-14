
import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:route_change_example/third_route.dart';


/**
 * # Stateless Widget 사용
 *    데이터 전달 -> 생성자 사용
 *
 *
 *
 *
 * **/
class SecondRoute extends StatelessWidget {

  String str;
  SecondRoute(this.str){
    _showToastMessage(str);
  }

  void _showToastMessage(String str){
    Fluttertoast.showToast(
        msg: str,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }//_showToastMessage

  void _moveToThirdRoute(BuildContext context){
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ThirdRoute("this is from SecondRoute"))
    );
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Second Route"),),
        body: Center(
          child: Row(
            children: [
              TextButton(child: Text("third", style: TextStyle(fontSize: 40)),
                onPressed: (){
                  _moveToThirdRoute(context);
                  },
              ),
              TextButton(child: Text("return", style: TextStyle(fontSize: 40)),
                onPressed: (){
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
