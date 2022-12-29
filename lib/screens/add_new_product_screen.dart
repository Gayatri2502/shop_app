import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../providers/server_end_product_view.dart';

class AddNewProductScreen extends StatelessWidget {
  AddNewProductScreen({Key? key}) : super(key: key);

  //title, price, description, imageUrl
  TextEditingController titleController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add New Product"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: "Title"),
                textInputAction: TextInputAction.next,
                controller: titleController,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Price"),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                controller: priceController,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Description"),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.multiline,
                controller: descriptionController,
              ),
              Row(
                children: [
                  Expanded(
                    child: StreamBuilder<String>(
                        stream: Stream.periodic(Duration(milliseconds: 1), (_) {
                          return imageUrlController.text;
                        }),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            if (snapshot.data!.isNotEmpty) {
                              return Image.network(snapshot.data!);
                            }

                            return const Text("No Image");
                          }
                          return const Text("No Image");
                        }),
                  ),
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      decoration: const InputDecoration(labelText: "Image Url"),
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.url,
                      controller: imageUrlController,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  String productId =
                      DateTime.now().millisecondsSinceEpoch.toString();
                  Product newProduct = Product(
                      Product_Id: productId,
                      Product_name: titleController.text,
                      Product_description: descriptionController.text,
                      Product_price: double.parse(priceController.text),
                      image_url: imageUrlController.text);

                  FirebaseDatabase.instance
                      .ref()
                      .child("Product")
                      .child(newProduct.Product_Id)
                      .set(newProduct.toJson());
                },
                child: const Text("Add Product"),
              )
            ],
          ),
        ));
  }
}
