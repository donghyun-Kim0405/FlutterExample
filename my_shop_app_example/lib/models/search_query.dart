import 'package:flutter/cupertino.dart';

class SearchQuery with ChangeNotifier{
  String text = '';

  void updateText(String newText){
    text = newText;
    notifyListeners();

  }


}