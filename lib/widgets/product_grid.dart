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
    List<Product> obj1 = Provider.of<ProductProvider>(context).items;
    bool showFavorites = Provider.of<ProductProvider>(context).showFavorites;
    List<Product> favoriteItems = [];
    for (var element in obj1) {
      if (element.isFavorite) {
        favoriteItems.add(element);
      }
    }

    return SizedBox(
        height: MediaQuery.of(context).size.height,
        child: !showFavorites
            ? GridView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: obj1.length,
                itemBuilder: (ctx, i) => StreamBuilder<Product>(
                    stream:
                        Stream.periodic(const Duration(microseconds: 500), (_) {
                      return obj1[i];
                    }),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ProductItems(
                          onShoppingCartButtonPressed: () {
                            Provider.of<ProductProvider>(context, listen: false)
                                .addProductToCart(obj1[i]);
                          },
                          product: obj1[i],
                          onFavoritePressed: () {
                            FirebaseDatabase.instance
                                .ref()
                                .child("Favorite Products")
                                .child(Provider.of<ProductProvider>(context,
                                        listen: false)
                                    .items[i]
                                    .Product_Id)
                                .set(Provider.of<ProductProvider>(context,
                                        listen: false)
                                    .items[i]
                                    .toJson());
                          },
                        );
                      }
                      return Container();
                    }),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
              )
            : GridView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: favoriteItems.length,
                itemBuilder: (ctx, i) => StreamBuilder<Product>(
                    stream:
                        Stream.periodic(const Duration(microseconds: 500), (_) {
                      return favoriteItems[i];
                    }),
                    builder: (context, snapshot) {
                      return ProductItems(
                        onShoppingCartButtonPressed: () {
                          Provider.of<ProductProvider>(context, listen: false)
                              .addProductToCart(favoriteItems[i]);
                        },
                        product: favoriteItems[i],
                        onFavoritePressed: () {
                          Provider.of<ProductProvider>(context, listen: false)
                              .toggleFavorite(obj1.indexWhere((element) =>
                                  element.Product_Id ==
                                  favoriteItems[i].Product_Id));
                        },
                      );
                    }),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
              ));
  }
}
