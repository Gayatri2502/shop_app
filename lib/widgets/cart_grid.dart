import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CartItem extends StatelessWidget {
  String id;
  double price;
  String name;
  int quantity;
  String image;

  CartItem(
    this.id,
    this.price,
    this.name,
    this.quantity,
    this.image, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
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
        showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                  title: Text("Are you Sure ? "),
                  content:
                      Text('Do you Want to remove the item from the cart ? '),
                  actions: <Widget>[
                    ElevatedButton(
                      child: Text('No'),
                      onPressed: () {
                        Navigator.of(ctx).pop(false);
                      },
                    ),
                    ElevatedButton(onPressed: () {
                      Navigator.of(context).pop(true);
                    }, child: Text('Yes'))
                  ],
                ));
      },
      onDismissed: (direction) {
        Provider.of<CartProvider>(context, listen: false).removeSingleItem(id);
      },
      child: Card(
        margin: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
                child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: FittedBox(child: Text('\$$image')),
            )),
            subtitle: Text('Total: \$${(price * quantity)}'),
            trailing: Text('$quantity X'),
          ),
        ),
      ),
    );
  }
}
