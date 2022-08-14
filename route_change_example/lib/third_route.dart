import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'main.dart';


/**
 *
 * # Stateful Widget에서 데이터 전달받아 토스트 메시지 띄우기
 *
 * final - runTime에 결정되는 불변값
 * const - compileTime에 결정되는 불변값
 *
 *
 * !State 에서 StatefullWidget의 변수에 접근하는 방법
 * State에서 widget.변수이름
 *
 * **/
class ThirdRoute extends StatefulWidget {

  final String str; //const생성자로부터 값을 초기화 하기 위해서는 변수를 final로 선언

  const ThirdRoute(this.str); //const 생성자는 실행 블록을 가질 수 없음

  @override
  State<ThirdRoute> createState() => _ThirdRouteState();
}

class _ThirdRouteState extends State<ThirdRoute> {

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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("third route")),
      body: Center(
        child: Row(
          children: [
            TextButton(child: Text("return", style: TextStyle(fontSize: 40),), onPressed: (){
              Navigator.pop(context);
            }),
            TextButton(child: Text("move to first", style: TextStyle(fontSize: 40),), onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyApp())
              );
            },)
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _showToastMessage(widget.str);
  }
}
