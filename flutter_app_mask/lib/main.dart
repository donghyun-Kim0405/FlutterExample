import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_mask/model/Store.dart';
import 'package:flutter_app_mask/repository/store_repository.dart';
import 'package:flutter_app_mask/ui/view/main_page.dart';
import 'package:flutter_app_mask/viewModel/store_viewmodel.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';


void main() {
  runApp(
    ChangeNotifierProvider.value(
      value: StoreViewModel(),
      child: MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage()
    );
  }
}

