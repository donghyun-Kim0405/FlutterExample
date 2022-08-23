import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'data_util.dart';

class MyListView extends StatefulWidget {
  @override
  State<MyListView> createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  var datas = DataUtil().createData();


  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: datas.map((e){
          return ListTile(
            title: Text(e)
          );
        }).toList()
      ),
    );
  }
}
