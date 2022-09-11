import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'list_screen.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // 2초 내 moveScreen함수 동작하도록 설정
    Timer(Duration(seconds: 2), (){
      moveScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'SplashScreen',
              style: TextStyle(
                fontSize: 20
              ),
            ),
            Text(
              '나만의 일정 관리',
              style: TextStyle(
                  fontSize: 20
              ),
            )
          ],
        ),
      ),
    );
  }

  //then : 앞 실행이 완료 될 때 호출 할 콜백을 등록
  void moveScreen() async{
    await checkLogin().then((isLogin){
      if(isLogin){
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ListScreen()));
      }else{
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
      }
    });
  }

  Future<bool> checkLogin() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLogin = prefs.getBool('isLogin') ?? false;  //isLogin이라는 파라미터를 가져옴 만약 null 일 경우 false로 초기화
    print("[*] isLogin : " + isLogin.toString());
    Fluttertoast.showToast(msg: isLogin.toString());
    return isLogin;
  }

}
