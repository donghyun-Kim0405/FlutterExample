import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:route_change_example/second_route.dart';


/**
 * Material App을 사용한 위젯에서 화면전환을 시도할 경우 에러가 발생한다.
 *
 * 위젯 대신 main()에 runApp부분에 MaterialApp을 삽입
 *
 * */
void main() {
  runApp(
    MaterialApp(
      title: "MyApp",
      home: MyApp(),
    )
  );

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

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

    void _moveToNextRoute(){
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SecondRoute("this is from firstRoute"))
      );
    }//_moveToNextRoute

    void _popRoute(){
      Navigator.pop(context);
    }


    return Scaffold(
        appBar: AppBar(
          title: Text("app bar"),
        ),
        body:
        Center(
          child: Row(
            children: [
              TextButton(child: Text("route 1", style: TextStyle(fontSize: 40),),onPressed: (){
                _showToastMessage("route1 selected");
                _moveToNextRoute();
              },),
              TextButton(child: Text("pop route"), onPressed: (){
                _popRoute();
              },)
            ],
          ),
        )
      );
  }
}
