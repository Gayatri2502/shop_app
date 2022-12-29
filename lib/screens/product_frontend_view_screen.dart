import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/product_provider.dart';
import 'package:shop_app/providers/server_end_product_view.dart';
import 'package:shop_app/screens/order_screen.dart';
import 'package:shop_app/screens/sideBar.dart';

import '../widgets/product_grid.dart';
import 'Profile_Page.dart';

enum option {
  favorite,
  order,
  product,
}

class Frontend_View_ofproduct extends StatefulWidget {
  @override
  State<Frontend_View_ofproduct> createState() =>
      _Frontend_View_ofproductState();
}

class _Frontend_View_ofproductState extends State<Frontend_View_ofproduct> {
  @override
  Widget build(BuildContext context) {
    List<Product> shoppingCartItems =
        Provider.of<ProductProvider>(context).shoppingCartItems;

    return Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
          actions: [
            Badge(
              badgeContent: Text(
                shoppingCartItems.length.toString(),
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
              position: const BadgePosition(start: 30, bottom: 30),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return OrderPage();
                  }));
                },
                icon: const Icon(Icons.shopping_cart),
                alignment: Alignment.bottomLeft,
                iconSize: 30,
              ),
            ),
            IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return ProfileScreen();
                  }));
                },
                icon: const Icon(Icons.person)),
            PopupMenuButton(
                color: Colors.white60,
                icon: const Icon(Icons.more_vert),
                itemBuilder: (_) => [
                      PopupMenuItem(
                        value: 1,
                        onTap: () {
                          Provider.of<ProductProvider>(context, listen: false)
                              .toggleShowFavorite(true);
                        },
                        child: Text('Your Wishllist',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w700)),
                      ),
                      PopupMenuItem(
                        value: 2,
                        child: Text(
                          'Show All',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                        onTap: () {
                          Provider.of<ProductProvider>(context, listen: false)
                              .toggleShowFavorite(false);
                        },
                      ),
                      PopupMenuItem(
                        value: 3,
                        child: Text('Your Orders',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w700)),
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return OrderPage();
                          }));
                        },
                      ),
                      PopupMenuItem(
                        value: 4,
                        child: Text('Manage Account',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w700)),
                      ),
                      PopupMenuItem(
                        value: 5,
                        child: Text('Contact Us',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w700)),
                      )
                    ]),
          ],
          leading: IconButton(
            icon: Icon(Icons.menu),
            iconSize: 40,
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return NavBar();
              }));
            },
          ),
          iconTheme: const IconThemeData(color: Colors.white60),
          actionsIconTheme: IconThemeData(color: Colors.pink.shade50),
          backgroundColor: Colors.black,
          title: const Text('Evyan Store ∞'),
        ),
        body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.black,
                Colors.brown,
              ],
            )),
            child: ProductGrid()));
  }
}
