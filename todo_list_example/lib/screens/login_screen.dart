import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('로그인'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          width: MediaQuery.of(context).size.width *0.85,
          child: ElevatedButton(
            onPressed: (){
              setLogin();
              showToast();
            },
            child: Text('로그인'),
          ),
        ),
      ),
    );
  }// build()

  Future setLogin() async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
     prefs.setBool('isLogin', true);  // SharedPreference에 key-value 형태로 값 쓰기 : 이후 CRUD는 isLogin을 기준으로 작성
  }//setLogin()

  void showToast(){
    Fluttertoast.showToast(msg: "tapped login button");
  }

}
