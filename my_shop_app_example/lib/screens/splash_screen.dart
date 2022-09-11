import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_shop_app_example/models/model_auth.dart';
import 'package:my_shop_app_example/providers/cart_provider.dart';
import 'package:my_shop_app_example/tabs/tab_cart.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Future<bool> checkLogin() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final authClient = Provider.of<FirebaseAuthProvider>(context, listen: false);
    final cartProvider = Provider.of<CartProvider>(context, listen: false);

    bool isLogin = prefs.getBool('isLogin') ?? false;
    print('[*] 로그인 상태');

    if(isLogin) {
      String? email = prefs.getString('email');
      String? password = prefs.getString('password');

      print(email);
      print(password);


      print('[*] 저장된 정보로 로그인 재시도');
      await authClient.loginWithEmail(email!, password!).then((loginStatus){
        if(loginStatus == AuthStatus.loginSuccess){
          print("[*] 로그인 성공");
          cartProvider.fetchCartItemsOrAddCart(authClient.user);
        }else{
          print("[*] 로그인 실패");
          isLogin = false;
          prefs.setBool('isLogin', false);
        }
      });
    }

    return isLogin;
  }

  void moveScreen() async{
    await checkLogin().then((isLogin){
      if(isLogin){
        Navigator.of(context).pushReplacementNamed('/index');
      }else{
        Navigator.of(context).pushReplacementNamed('/login');
      }
    });
  }

  @override
  void initState() {
    super.initState();

    Timer(Duration(milliseconds: 1500), (){
      moveScreen();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Center(
        child: Text('Splash Screen'),
      ),
    );
  }
}