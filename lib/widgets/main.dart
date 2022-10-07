import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/product_provider.dart';

import '../providers/cart_provider.dart';
import '../providers/server_end_product_view.dart';
import '../screens/loginpage.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: ShopApp(),
    ));

class ShopApp extends StatefulWidget {
  const ShopApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ShopAppState();
}

class _ShopAppState extends State {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        (ctx) => Product;
      },
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.white30,
          primarySwatch: Colors.blue,
        ),
        home: LoginPage(),
        /*routes: {
          UserProductScreen.routeName: (ctx)=> UserProductScreen(Product_name, imageUrl),
        },*/
      ),
    );
  }
}
