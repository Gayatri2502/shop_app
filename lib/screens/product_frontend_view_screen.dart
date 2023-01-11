import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/product_provider.dart';
import 'package:shop_app/providers/server_end_product_view.dart';
import 'package:shop_app/screens/shopping_cart_screen .dart';
import 'package:shop_app/screens/sideBar.dart';

import '../providers/app_states.dart';
import '../widgets/product_grid.dart';
import 'Profile_Page.dart';

enum option {
  favorite,
  order,
  product,
}

class Frontend_View_ofproduct extends StatefulWidget {
  const Frontend_View_ofproduct({Key? key}) : super(key: key);

  @override
  State<Frontend_View_ofproduct> createState() =>
      _Frontend_View_ofproductState();
}

class _Frontend_View_ofproductState extends State<Frontend_View_ofproduct> {
  @override
  Widget build(BuildContext context) {
    List<Product> shoppingCartGridItems =
        Provider.of<ProductProvider>(context).shoppingCartGridItems;

    return Scaffold(
        drawer: const NavBar(),
        appBar: AppBar(
          actions: [
            Badge(
              badgeContent: Text(
                shoppingCartGridItems.length.toString(),
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
              position: const BadgePosition(start: 30, bottom: 30),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return  OrderPage();
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
                    return const ProfileScreen();
                  }));
                },
                icon: const Icon(Icons.person)),
            PopupMenuButton(
                icon: const Icon(Icons.more_vert),
                itemBuilder: (_) => [
                      PopupMenuItem(
                        value: 1,
                        onTap: () {
                          Provider.of<ProductProvider>(context, listen: false)
                              .toggleShowFavorite(true);
                        },
                        child: Row(
                          children: const [
                            Icon(
                              Icons.settings,
                              color: Colors.black,
                            ),
                            Text('Settings',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w700)),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        value: 2,
                        child: Row(
                          children: const [
                            Icon(
                              Icons.favorite,
                              color: Colors.black,
                            ),
                            Text(
                              'Wish List',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        onTap: () {
                          Provider.of<ProductProvider>(context, listen: false)
                              .toggleShowFavorite(false);
                        },
                      ),
                      PopupMenuItem(
                        value: 3,
                        child: Row(
                          children: const [
                            Icon(
                              Icons.add_shopping_cart_sharp,
                              color: Colors.black,
                            ),
                            Text('Your Orders',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w700)),
                          ],
                        ),
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return  OrderPage( );
                          }
                          ));
                        },

                      ),
                      PopupMenuItem(
                        value: 4,
                        child: Row(
                          children: const [
                            Icon(
                              Icons.manage_history_sharp,
                              color: Colors.black,
                            ),
                            Text('Manage Account',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w700)),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        value: 5,
                        child: Row(
                          children: const [
                            Icon(
                              Icons.quick_contacts_dialer,
                              color: Colors.black,
                            ),
                            Text('Contact Us',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w700)),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        value: 6,
                        child: Row(
                          children: const [
                            Icon(
                              Icons.logout,
                              color: Colors.black,
                            ),
                            Text('LogOut',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w700)),
                          ],
                        ),
                      )
                    ]),
          ],
          leading: IconButton(
            icon: const Icon(Icons.menu),
            iconSize: 40,
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const NavBar();
              }));
            },
          ),
          iconTheme: const IconThemeData(color: Colors.white60),
          actionsIconTheme: IconThemeData(color: Colors.pink.shade50),
          backgroundColor: Colors.blue.shade900,
          title: const Text('Evyan Store ∞'),
        ),
        body: Container(
          color: Colors.black12,
            // decoration: const BoxDecoration(
            //     gradient: LinearGradient(
            //   begin: Alignment.topRight,
            //   end: Alignment.bottomLeft,
            //   colors: [
            //     Colors.black,
            //     Colors.brown,]
            // )),
            child: ProductGrid(allItems: shoppingCartGridItems,)));
  }
}
