
import 'package:flutter/foundation.dart';
import 'package:flutter_app_mask/repository/location_repository.dart';
import 'package:flutter_app_mask/repository/store_repository.dart';

import '../model/Store.dart';

class StoreViewModel with ChangeNotifier {
  final _storeRepository = StoreRepository(); //의존성 주입 예정
  final _locationRepository = LocationRepository();


  var isLoading = false;
  List<Store> stores = [];

  //constructor
  StoreViewModel(){
    fetch();
  }

  /**
   * loading시와 데이터를 로드 완료했을 경우 두 화면으로 분기하기 위해 notify 두번 수행
   * **/
  Future fetch() async{
    isLoading = true;
    notifyListeners();  //observer.value변경과 같은 기능 수행
    stores = await _storeRepository.fetch();
    isLoading = false;
    notifyListeners();  //observer.value변경과 같은 기능 수행

  }
}