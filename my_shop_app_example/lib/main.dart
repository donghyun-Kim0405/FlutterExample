import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_shop_app_example/models/model_auth.dart';
import 'package:my_shop_app_example/models/search_query.dart';
import 'package:my_shop_app_example/providers/cart_provider.dart';
import 'package:my_shop_app_example/providers/item_provider.dart';
import 'package:my_shop_app_example/screens/screen_detail.dart';
import 'package:my_shop_app_example/screens/screen_index.dart';
import 'package:my_shop_app_example/screens/screen_login.dart';
import 'package:my_shop_app_example/screens/screen_search.dart';
import 'package:my_shop_app_example/screens/splash_screen.dart';
import 'package:my_shop_app_example/screens/screen_register.dart';
import 'package:provider/provider.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => FirebaseAuthProvider()),
      ChangeNotifierProvider(create: (_) => ItemProvider()),
      ChangeNotifierProvider(create: (_) => SearchQuery()),
      ChangeNotifierProvider(create: (_) => CartProvider())
    ],
    child: MaterialApp(
      title : "Flutter Shopping mall",
      routes: {
        '/': (context) => SplashScreen(),
        '/index': (context) => IndexScreen(),
        '/login' : (context) => LoginScreen(),
        '/register' : (context) => RegisterScreen(),
        '/search' : (context) => SearchScreen(),
        '/detail' : (context) => DetailScreen()
      },
      initialRoute: '/',
    ),
    );

  }
}
