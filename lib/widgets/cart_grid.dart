import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/server_end_product_view.dart';

import '../providers/cart_provider.dart';

class CartItem extends StatelessWidget {
  Product product;

  int quantity;
  Function() onDismissed;

  CartItem(
    this.product,
    this.quantity,
    this.onDismissed, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(product.Product_Id),
      background: Container(
          color: Colors.redAccent.shade700,
          child: Icon(
            Icons.delete,
            color: Colors.white,
            size: 40,
          ),
          alignment: Alignment.centerRight,
          padding: EdgeInsets.only(right: 20),
          margin: EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 4,
          )),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) async {
        onDismissed();
      },
      onDismissed: (direction) {
        Provider.of<CartProvider>(context, listen: false)
            .removeSingleItem(product.Product_Id);
      },
      child: Card(
        margin: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading:
                CircleAvatar(backgroundImage: NetworkImage(product.image_url)),
            title: Text(product.Product_name),
            subtitle: Text('Total: \$${(product.Product_price * quantity)}'),
            trailing: Text('$quantity X'),
          ),
        ),
      ),
    );
  }
}
