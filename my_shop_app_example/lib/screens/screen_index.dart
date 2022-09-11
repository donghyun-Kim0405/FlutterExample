import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../tabs/tab_cart.dart';
import '../tabs/tab_home.dart';
import '../tabs/tab_profile.dart';
import '../tabs/tab_search.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({Key? key}) : super(key: key);

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {

  int _currentIndex = 0;

  final List<Widget> _tabs = [
    HomeTab(),
    SearchTab(),
    CartTab(),
    ProfileTab()
  ];

  final bottomNavItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
    BottomNavigationBarItem(icon: Icon(Icons.search), label: '검색'),
    BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: '장바구니'),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: '프로필')
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("flutter shopping mall"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(fontSize: 12),
        currentIndex: _currentIndex,
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
          if(index == 1) {
            setState(() {
              _currentIndex = 0;
            });
            print("pushed search");
            Navigator.pushNamed(context, '/search');
          }
        },
        items: bottomNavItems,
      ),
      body: _tabs[_currentIndex],
    );
  }
}
