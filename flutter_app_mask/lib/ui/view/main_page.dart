import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_mask/ui/widget/remain_status_list_tile.dart';
import 'package:provider/provider.dart';

import '../../model/Store.dart';
import '../../viewModel/store_viewmodel.dart';

class MainPage extends StatelessWidget {
  var stores = <Store>[];

  @override
  Widget build(BuildContext context) {
    final storeViewModel = Provider.of<StoreViewModel>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text("마스크 재고 있는 곳 :${storeViewModel.stores.length} 곳"),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.refresh), onPressed: () {
              storeViewModel.fetch();
            })
          ],
        ),
        body: storeViewModel.isLoading == true
            ? loadingWidget()
            : ListView(
          children: storeViewModel.stores
              .where((element) {
            var flag = false;
            if (element.remainStat == "plenty" ||
                element.remainStat == "some") {
              flag = true;
            }
            return flag;
          })
              .map((e) {
            return ListTile(
                title: Text(e.name ?? ""),
                subtitle: Text(e.addr ?? ""),
                trailing: RemainStatusListTile(e)
            );
          }).toList(),
        )
    );
  }
}
