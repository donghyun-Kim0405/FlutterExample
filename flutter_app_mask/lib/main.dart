import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_mask/model/Store.dart';
import 'package:http/http.dart' as http;


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage()
    );
  }
}




class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final stores = <Store>[];
  var isLoading= true;  //해당 값에 따라 화면 분기하도록 변경



  //Future는 생략가능
  Future? fetch() async {
    setState(() {
      isLoading = true;
    });


    var url = "https://gist.githubusercontent.com/junsuk5/bb7485d5f70974deee920b8f0cd1e2f0/raw/063f64d9b343120c2cb01a6555cf9b38761b1d94/sample.json";
    var response = await http.get(Uri.parse(url));
    final json_result = jsonDecode(utf8.decode(response.bodyBytes));
    final json_stores = json_result['stores'];

    /***
     * 화면을 다시 그리도록 setState로 Logic감싸기
     * */
    setState(() {
      stores.clear();
      json_stores.forEach((element) { //dynamic 타입만 foreach 가능
        Store store = Store.fromJson(element);
        stores.add(store);
      });
      isLoading = false;
    });

    print("fetch success");
  }

  @override
  void initState() {
    super.initState();
    fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("마스크 재고 있는 곳 :${stores.length} 곳"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.refresh), onPressed: fetch)
        ],
      ),
      body: isLoading == true
          ? loadingWidget()
          : ListView(
        children: stores.map((e) {
          return ListTile(
              title: Text(e.name ?? ""),
              subtitle: Text(e.addr ?? ""),
              trailing: _buildRemainStatWidget(e)
          );
        }).toList(),
      )
    );

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

}