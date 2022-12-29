import 'package:flutter/material.dart';

import '../providers/server_end_product_view.dart';

class EditProductScreen extends StatefulWidget {
  const EditProductScreen({Key? key}) : super(key: key);

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {


  final priceFocusNode = FocusNode();
  final DescriptionFocusNode = FocusNode();
  final TitleFocusNode = FocusNode();
  final imageUrlFocusNode = FocusNode();
  final imageUrlController = TextEditingController();
  final form = GlobalKey<FormState>();
  var editedproduct = Product(
      Product_Id: '',
      Product_name: " ",
      Product_description: " ",
      image_url: '',
      Product_price: 0);

  @override
  void initState() {

    imageUrlFocusNode.addListener(updateImageUrl);
    super.initState();
  }


  void dispose() {
    priceFocusNode.dispose();
    DescriptionFocusNode.dispose();
    super.dispose();
  }

  void updateImageUrl() {
    if (!imageUrlFocusNode.hasFocus) {
      setState(() {});
      print(editedproduct.Product_Id);
      print(editedproduct.Product_name);
      print(editedproduct.Product_price);
      print(editedproduct.Product_description);
      print(editedproduct.image_url);
    }
  }

  saveForm() {
    final isValid= form.currentState!.validate();
    if(!isValid){
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    //final productsData = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Product List"),
        actions: <Widget>[
          IconButton(onPressed: saveForm, icon: Icon(Icons.save)),
          IconButton(onPressed: () {}, icon: Icon(Icons.add))
        ],
      ),
      // body: Padding(
      //     padding: EdgeInsets.all(8),
      //     child: ListView.builder(
      //       itemCount: productsData.items.length,
      //       itemBuilder: (_, i) => UserProductScreen(
      //           productsData.items[i].Product_Id,
      //           productsData.items[i].Product_name,
      //           productsData.items[i].image_url),
      //     )),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
            key: form,
            child: ListView(
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: "Title"),
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(TitleFocusNode);
                  },
                  validator: (value){
                    if (value!.isEmpty){
                      return 'please provide a value';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    editedproduct = Product(
                        Product_Id: editedproduct.Product_Id,
                        Product_name: value.toString(),
                        Product_description: editedproduct.Product_description,
                        Product_price: editedproduct.Product_price,
                        image_url: editedproduct.image_url);
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "price "),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.multiline,
                  focusNode: priceFocusNode,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(priceFocusNode);
                  },
                    onSaved: (value) {
                      editedproduct = Product(
                          Product_Id: editedproduct.Product_Id,
                          Product_name: editedproduct.Product_name,
                          Product_description: editedproduct.Product_description,
                          Product_price: double.parse(value.toString()),
                          image_url: editedproduct.image_url);
                    }
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Description"),
                  maxLines: 3,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(DescriptionFocusNode);
                  },
                    onSaved: (value) {
                      editedproduct = Product(
                          Product_Id: editedproduct.Product_Id,
                          Product_name: editedproduct.Product_name,
                          Product_description: value.toString(),
                          Product_price: editedproduct.Product_price,
                          image_url: editedproduct.image_url);
                    }
                ),
                Row(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      margin: EdgeInsets.only(
                        top: 8,
                        right: 10,
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(
                        width: 1,
                        color: Colors.grey,
                      )),
                      child: imageUrlController.text.isEmpty
                          ? Text('Enter a URL')
                          : FittedBox(
                              child: Image.network(imageUrlController.text,
                                  fit: BoxFit.cover),
                            ),
                    ),
                    Expanded(
                        child: TextFormField(
                      decoration: InputDecoration(labelText: 'Image URL'),
                      keyboardType: TextInputType.url,
                      textInputAction: TextInputAction.done,
                      controller: imageUrlController,
                      focusNode: imageUrlFocusNode,
                     /* onFieldSubmitted: saveForm(),*/
                            onSaved: (value) {
                              editedproduct = Product(
                                  Product_Id: editedproduct.Product_Id,
                                  Product_name: editedproduct.Product_name,
                                  Product_description: editedproduct.Product_description,
                                  Product_price: editedproduct.Product_price,
                                  image_url: value.toString());
                            }
                    ))
                  ],
                )
              ],
            )),
      ),
    );
  }
}
