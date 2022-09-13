import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class ImageViewModel with ChangeNotifier{
  List<Widget> images = [];

  void addImage(Widget item){
      images.add(item);
      //notifyListeners();
      print(images.length.toString());
  }

  void removeImage(int index){
    images.removeAt(0);
    //notifyListeners();
    print("remove called");
  }




}