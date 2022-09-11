import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_shop_app_example/models/model_auth.dart';
import 'package:my_shop_app_example/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class CartTab extends StatelessWidget {
  const CartTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final authClient = Provider.of<FirebaseAuthProvider>(context);
    return FutureBuilder(
      future: cart.fetchCartItemsOrAddCart(authClient.user),
      builder: (context, snapshot){
        if(cart.cartItems.length == 0){
          return Center(
            child: CircularProgressIndicator(),
          );
        }else{
          return ListView.builder(
            itemCount: cart.cartItems.length,
            itemBuilder: (context, index){
              return ListTile(
                onTap: (){
                  Navigator.pushNamed(context, '/detail',
                  arguments: cart.cartItems[index]);
                },
                title: Text(cart.cartItems[index].title),
                subtitle: Text(cart.cartItems[index].price.toString()),
                leading: Image.network(cart.cartItems[index].imageUrl),
                trailing: InkWell(
                  child: Icon(Icons.delete),
                  onTap: (){
                    cart.removeItemFromCart(
                      authClient.user, cart.cartItems[index]
                    );
                  },
                ),

              );
            },
          );
        }
      },
    );


    return Container();
  }
}
