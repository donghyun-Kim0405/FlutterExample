import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/all.dart';

void main() {

  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "kakao Login",
      home: KakaoLoginPage(),
    );
  }
}

class KakaoLoginPage extends StatefulWidget {

  @override
  State<KakaoLoginPage> createState() => _KakaoLoginPageState();
}

class _KakaoLoginPageState extends State<KakaoLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        child: Text("카카오 로그인"),
        onPressed: (){
          loginButtonPressed();
        },
      ),
    );
  }

  Future<void> loginButtonPressed() async{
    /*String authCode = await AuthCodeClient.instance.request();
    print(authCode);*/
    var userApiInstance = UserApi.instance;
    await userApiInstance.loginWithKakaoAccount();
    User user = await userApiInstance.me();
    print(user.id);
    print(user.kakaoAccount?.profile?.nickname);
    userApiInstance.
    //_get_user_info();
  }



}


