import 'package:flutter/material.dart';
import 'package:flutter_app_mask/model/Store.dart';

class RemainStatusListTile extends StatelessWidget{
  final Store store;

  RemainStatusListTile(this.store); //constructor parameter로 들어온 값을 store변수에 저장


  @override
  Widget build(BuildContext context) {
    return _buildRemainStatWidget(store)!;
  }
}

Widget? _buildRemainStatWidget(Store store) {
  var remainStatus = "판매중지";
  var description = "판매중지";
  var color = Colors.black;

  switch(store.remainStat) {
    case "plenty":
      remainStatus = "충분";
      description = "판매중지";
      color = Colors.green;
      break;
    case "some":
      remainStatus = "보통";
      description = "30~100";
      color = Colors.yellow;
      break;
    case "plenty":
      remainStatus = "부족";
      description = "2~30";
      color = Colors.red;
      break;
    case "empty":
      remainStatus ="소진임박";
      description = "1개이하";
      color = Colors.grey;
      break;

  }

  return Column(
    children: <Widget>[
      Text(
        remainStatus,
        style: TextStyle(color: color, fontWeight: FontWeight.bold),
      ),
      Text(
        description,
        style: TextStyle(color: color),
      )
    ],
  );
}

Widget? loadingWidget(){
  return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("loading..."),
          CircularProgressIndicator()
        ],
      )
  );
}

