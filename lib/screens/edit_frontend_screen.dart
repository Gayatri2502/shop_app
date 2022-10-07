import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/widgets/user_products_screen.dart';

import '../providers/product_provider.dart';
import '../providers/server_end_product_view.dart';

class EditProductScreen extends StatefulWidget {

  static const routeName ='/user-products';
  const EditProductScreen({Key? key}) : super(key: key);

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  @override
  Widget build(BuildContext context) {

    final productsData = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Product List"),
        actions: <Widget>[IconButton(onPressed: (){}, icon: Icon(Icons.add))],
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(itemCount:  productsData.items.length,
          itemBuilder: (_,i )=>UserProductScreen(productsData.items[i].Product_name, productsData.items[i].image_url),)
      ),
    );
  }
}
