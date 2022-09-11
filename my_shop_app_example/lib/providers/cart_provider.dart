import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../models/item.dart';

class CartProvider with ChangeNotifier {
  late CollectionReference cartReference;
  List<Item> cartItems = [];
  CartProvider({referemce}){
    cartReference = referemce ?? FirebaseFirestore.instance.collection('cart');
  }

  Future<void> fetchCartItemsOrAddCart(User? user) async{
    if(user == null) {
      return;
    }

    final cartSnapshot = await cartReference.doc(user.uid).get();
    if(cartSnapshot.exists){ //존재할 경우 전역 변수 초기화
      Map<String, dynamic> cartItemsMap = cartSnapshot.data() as Map<String, dynamic>;
      List<Item> temp = [];
      for(var item in cartItemsMap['item']){
        temp.add(Item.fromMap(item));
      }
      cartItems = temp;
      notifyListeners();
    }else{ //존재하지 않을경우 firecloudStore에 저장
      await cartReference.doc(user.uid).set({'item': []});
    }
  }

  Future<void> addItemToCart(User? user, Item item) async{
    cartItems.add(item);
    Map<String, dynamic> cartItemsMap = {
      'items': cartItems.map((item){
        return item.toSnapshot();
      }).toList()
    };
    await cartReference.doc(user!.uid).set(cartItemsMap);
    notifyListeners();
  }

  Future<void> removeItemFromCart(User? user, Item item) async{
    cartItems.removeWhere((element) => element.id == item.id);
    Map<String, dynamic> cartItemsMap = {
      'items': cartItems.map((item){
        return item.toSnapshot();

      }).toList()
    };
    await cartReference.doc(user!.uid).set(cartItemsMap);
    notifyListeners();

  }

  bool isItemInCart(Item item){
    return cartItems.any((element) => element.id == item.id);
  }

}