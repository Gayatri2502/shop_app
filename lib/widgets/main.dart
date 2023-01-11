import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/product_provider.dart';
import '../providers/app_states.dart';
import '../providers/cart_provider.dart';
import '../providers/server_end_product_view.dart';
import '../screens/loginpage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ProductProvider()),
      ChangeNotifierProvider(create: (_)=> StateProvider())
    ],
    child: const ShopApp(),
  ));
}

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
        home: const LoginPage(),
        /*routes: {
          UserProductScreen.routeName: (ctx)=> UserProductScreen(Product_name, imageUrl),
        },*/
      ),
    );
  }
}
