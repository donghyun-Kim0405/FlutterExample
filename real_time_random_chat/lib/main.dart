import 'package:flutter/material.dart';
import 'package:real_time_random_chat/sign/sign_in_home.dart';

void main() {

  runApp(
    MaterialApp(
      title: "MyApp",
      home: MyApp(),
    )
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  void moveToSignInHome(){
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SignInHome())
    );
  }



  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(child: Text("signInHome"),onPressed: (){
        moveToSignInHome();
      },),
    );
  }
}
