import 'package:flutter/material.dart';
import 'package:flutter_delivery_app/common/component/custom_text_form_field.dart';
import 'package:flutter_delivery_app/user/view/login_screen.dart';

void main() {
  runApp(const _App());
}
class _App extends StatelessWidget {
  const _App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'NotoSans'  //모든폰트 기본으로 적용
      ),
      debugShowCheckedModeBanner: true,
      home: LoginScreen(),

    );
  }
}
