class DataUtil{

  List<String> createData(){
    final arr = <String>[];
    for(var i = 0; i<20; i++) {
      arr.add(i.toString());
    }
    return arr;
  }

}