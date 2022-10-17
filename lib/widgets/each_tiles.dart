import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/server_end_product_view.dart';
import 'package:shop_app/screens/EachItemDetails.dart';

import '../providers/cart_provider.dart';

class ProductItems extends StatefulWidget {
  final Product product;
  final Function() onShoppingCartButtonPressed;
  final Function() onFavoritePressed;

  const ProductItems(
      {Key? key,
      required this.product,
      required this.onShoppingCartButtonPressed,
      required this.onFavoritePressed})
      : super(key: key);

  @override
  State<ProductItems> createState() => _ProductItemsState();
}

class _ProductItemsState extends State<ProductItems> {
  // final String Product_Id;
  @override
  Widget build(BuildContext context) {
    final snack = Provider.of<CartProvider>(context);

    return ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: GridTile(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return EachProductDetails(product: widget.product);
              }));
              // Navigator.of(context).push(MaterialPageRoute(builder: (context){
              //   return EachProductDetails("Product Name");
              //}));
            },
            child: Image.network(
              widget.product.image_url,
              fit: BoxFit.cover,
            ),
          ),
          footer: GridTileBar(
              backgroundColor: Colors.black,
              //action : IconButton(onPressed: null, icon: Icon(Icons.account_circle_rounded));
              leading: IconButton(
                icon: Icon(widget.product.isFavorite
                    ? Icons.favorite
                    : Icons.favorite_border_outlined),
                onPressed: () {
                  widget.onFavoritePressed();
                },
                color: Colors.red.shade900,
              ),
              title: Center(
                child: Text(
                  widget.product.Product_name,
                  textAlign: TextAlign.center,
                ),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.add_shopping_cart),
                onPressed: () {
                  widget.onShoppingCartButtonPressed();
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: const Text("Added item to Cart "),
                        duration: const Duration(seconds: 2),
                        action: SnackBarAction(
                            label: "UNDO",
                            onPressed: () {
                              snack.removeSingleItem(widget.product.Product_Id);
                            })),
                  );
                },
                color: Colors.white,
              )),
        ));
  }
}
