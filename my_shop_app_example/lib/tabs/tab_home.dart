import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_shop_app_example/providers/item_provider.dart';
import 'package:provider/provider.dart';


/**
 * FutureBuilder
 *  - Future함수와 연결되어 Future함수가 실행되는 동안 그 결과를 받아 빌드할 수 있다.
 *  - 해당 예제에서의 Future함수는 itemProvider.fetchItems()이다.
 * */
class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    print("=================================================");
    print("homeTab Started");
    final itemProvider = Provider.of<ItemProvider>(context);

    /**
     * FutureBuilder : 상품 정보를 언제 가져올지 모르는 이유로 사용
     * */
    return FutureBuilder(
      future: itemProvider.fetchItems(),
      builder: (context, snapshot){
        if(itemProvider.items.length == 0){
          return Center(
            child: CircularProgressIndicator(),
          );
        }else{
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1 / 1.5,
            ),
            itemCount: itemProvider.items.length,
            itemBuilder: (context, index){
              return GridTile(
                child: InkWell(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(itemProvider.items[index].imageUrl),
                        Text(
                          itemProvider.items[index].title,
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(itemProvider.items[index].price.toString()+"원",
                        style: TextStyle(fontSize: 16, color: Colors.red),),

                      ],
                    ),
                  ),
                  onTap: (){
                    Navigator.pushNamed(
                        context,
                        '/detail',
                        arguments: itemProvider.items[index]
                    );
                  },
                ),
              );
            },
          );
        }
      },
    );
  }
}
