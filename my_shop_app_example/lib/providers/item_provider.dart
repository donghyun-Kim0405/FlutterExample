import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../models/item.dart';

class ItemProvider with ChangeNotifier {
  late CollectionReference itemsReference;
  List<Item> items = [];
  List<Item> searchItems = [];

  ItemProvider({reference}) {
    itemsReference = reference ?? FirebaseFirestore.instance.collection('item');
  } //reference가 null일경우 Firestore에서 collection item을 반환

  Future<void> fetchItems()  async {
    try{
      items = await itemsReference.get().then((QuerySnapshot snapshot){
        return snapshot.docs.map((DocumentSnapshot document){
          return Item.fromSnapshot(document);
        }).toList();
      });
    }catch(e){
      print('error!');
      print(e);
    }

    print("item length");
    print(items.length.toString());
    notifyListeners();
  }

  Future<void> search(String query) async{
    searchItems = [];
    if(query.length == 0) {
      return;
    }
    for(Item item in items) {
      if(item.title.contains(query)){
        searchItems.add(item);
      }
    }
    notifyListeners();
  }

}