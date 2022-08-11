import 'dart:convert';
import 'package:flutter_app_mask/model/Store.dart';
import 'package:http/http.dart' as http;

class StoreRepository{

  Future<List<Store>> fetch() async {
    final stores = <Store>[];

    /*setState(() {
      isLoading = true;
    });*/

    var url = "https://gist.githubusercontent.com/junsuk5/bb7485d5f70974deee920b8f0cd1e2f0/raw/063f64d9b343120c2cb01a6555cf9b38761b1d94/sample.json";
    var response = await http.get(Uri.parse(url));
    final json_result = jsonDecode(utf8.decode(response.bodyBytes));
    final json_stores = json_result['stores'];

    /***
     * 화면을 다시 그리도록 setState로 Logic감싸기
     * */
    //setState(() {
      json_stores.forEach((element) { //dynamic 타입만 foreach 가능
        Store store = Store.fromJson(element);
        stores.add(store);
      } );


      /*isLoading = false;
    });*/

    print("fetch success");

    return stores.where((e) {
      return e.remainStat == "plenty" ||  //해당리스트에 포함되는 값들을 모아 리턴
          e.remainStat == "some" ||
          e.remainStat == "few";
    }).toList();
  }
}