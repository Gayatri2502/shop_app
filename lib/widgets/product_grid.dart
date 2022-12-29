import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/widgets/each_tile.dart';

import '../providers/product_provider.dart';
import '../providers/server_end_product_view.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({Key? key}) : super(key: key);

  // const ProductGrid({Key? key, required this.Loaded_products})
  //     : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool showFavorites = Provider.of<ProductProvider>(context).showFavorites;
    return SizedBox(
        height: MediaQuery.of(context).size.height,
        child: StreamBuilder<DatabaseEvent>(
            stream: FirebaseDatabase.instance.ref().child("Product").onValue,
            builder: (context, snapshot) {
              List<Product> obj1 = snapshot.data!.snapshot.children
                  .map((e) => Product.fromJson(jsonDecode(jsonEncode(e.value))))
                  .toList();
              return GridView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: obj1.length,
                itemBuilder: (ctx, i) => ProductItems(
                  onShoppingCartButtonPressed: () {
                    Provider.of<ProductProvider>(context, listen: false)
                        .addProductToCart(obj1[i]);
                  },
                  product: obj1[i],
                  onFavoritePressed: () {
                    FirebaseDatabase.instance
                        .ref()
                        .child("Favorite Products")
                        .child(
                            Provider.of<ProductProvider>(context, listen: false)
                                .items[i]
                                .Product_Id)
                        .set(
                            Provider.of<ProductProvider>(context, listen: false)
                                .items[i]
                                .toJson());
                  },
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
              );
            }));
  }
}
