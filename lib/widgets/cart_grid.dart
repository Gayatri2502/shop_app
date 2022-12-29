import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';
import '../providers/server_end_product_view.dart';


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
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 20),
          margin: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 4,
          ),
          child: const Icon(
            Icons.delete,
            color: Colors.white,
            size: 40,
          )),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) async {
        onDismissed();
        return null;
      },
      onDismissed: (direction) {
        Provider.of<CartProvider>(context, listen: false)
            .removeSingleItem(product.Product_Id);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
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
