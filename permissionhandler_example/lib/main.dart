import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';



/**
 * location permission 얻기 예제
 *
 * # Android
 *  - Manifest permission check
 *  - compile sdk 33 check
 *  - gradle properties
 *       add under codes
 *            android.useAndroidX=true
              android.enableJetifier=true

    #ios
      - PodFile 수정 -> 들여쓰기 주의
      - ios/Runner/info.plist <- permission 추가
 *
 *
 *
 * **/
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Future getCameraPermission() async{
    var status = await Permission.location.status;

    if (status.isDenied||status.isLimited ||status.isRestricted) {
      Permission.location.request();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  void initState() {
    super.initState();
    getCameraPermission();
  }

}
