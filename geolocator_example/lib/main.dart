import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geolocator_example/geo_locator_manager.dart';



/**
 * permission
 *
 * #android
 *  - manifest coarse & fineLocation 추가
 *  - compile sdk 33 check
 *
 *
 *  #ios
 *   - ios/runner/info.plist 가장하단에 다음을 추가
 *
 *  <key>NSLocationWhenInUseUsageDescription</key>
    <string>This app needs access to location when open.</string>
    <key>NSLocationAlwaysAndWhenInUseUsageDescription</key>
    <string>This app needs access to location when open and in the background.</string>
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
  final locationManager = GeoLocatorManager();
  Text text = Text("did not updated");
  
  void setLocation(Position position){
    var str = position.latitude.toString() + position.longitude.toString();

    setState(() {
      text = Text(str, style: TextStyle(fontSize: 40));
    });
  }//setLocation

  Future<void> getLocation() async {
    setLocation(await locationManager.getCurrentLocation());
  }





  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("geoLocator Example")),
        body: Center(
          child: Column(
            children: [
              text,
              TextButton(child: Text("get Location"), onPressed: (){
                getLocation();
              },)
            ],
          ),
        ),
      ),
    );
  }
}
