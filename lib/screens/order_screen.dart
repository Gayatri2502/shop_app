import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shop_app/providers/server_end_product_view.dart';
import 'package:shop_app/widgets/cart_grid.dart';
import '../widgets/cart_grid.dart';
import '../providers/product_provider.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Product> mapItems =
        Provider.of<ProductProvider>(context).shoppingCartItems;

    return Scaffold(
      appBar: AppBar(
        leading: const IconButton(
          icon: Icon(
            Icons.add_shopping_cart_outlined,
            color: Colors.white,
            size: 35,
          ),
          onPressed: null,
        ),
        title: const Text(
          "Orders",
          style: TextStyle(fontSize: 30),
        ),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height*0.91,
          child: Column(
            children: <Widget>[
              // Expanded(
              //   child: Card(
              //     child: Container(
              //       height: MediaQuery.of(context).size.height*0.00005,
              //       width: MediaQuery.of(context).size.width,
              //
              //
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           mainAxisAlignment: MainAxisAlignment.start,
              //           children: <Widget>[
              //             Text(
              //               "Items in your Cart:",
              //               style: TextStyle(
              //                   color: Colors.orange.shade700,
              //                   fontSize: 25,
              //                   //fontStyle: FontStyle.italic,
              //                   fontWeight: FontWeight.w500),
              //               textAlign: TextAlign.start,
              //             ),
              //             const Text(
              //               "\n*Check order status & track ,change or return items!!",
              //               textAlign: TextAlign.start,
              //               style: TextStyle(
              //                   fontSize: 15,
              //                   fontWeight: FontWeight.w700,
              //                   color: Colors.black),
              //             ),
              //           ],
              //         ),
              //
              //     ),
              //   ),
              // ),
              Expanded(
                child: Card(
                  child: Container(
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.black,
                        Colors.black45,
                      ],
                    )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          "Items in your Cart:",
                          style: TextStyle(
                              color: Colors.orange.shade700,
                              fontSize: 25,
                              //fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.start,
                        ),
                        const Text(
                          "\n*Check order status & track ,change or return items!!",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Colors.lightBlue),
                        ),


                        const Text(
                          'Total Amount:',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Chip(
                          label: Text(
                              '\$${mapItems.isNotEmpty ? mapItems.map((e) => e.Product_price).toList().reduce((value, element) => value + element) : '0.0'}'),
                          backgroundColor: Theme.of(context).primaryColor,
                        ),

                        Expanded(
                            child: ListView.builder(
                          itemBuilder: (ctx, i) => CartItem(
                              mapItems.toList()[i].Product_Id,
                              mapItems.toList()[i].Product_price,
                              mapItems.toList()[i].Product_name,
                              mapItems.toList()[i].Quantity,
                              mapItems.toList()[i].image_url),

                          itemCount: mapItems.length,
                        )),

                        Center(
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.teal.shade900),
                                padding: MaterialStateProperty.all(
                                    const EdgeInsets.all(20)),
                                textStyle: MaterialStateProperty.all(
                                    const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white))),
                            onPressed: () {},
                            child: const Text("PROCEED FOR PAYMENT"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Expanded(
              //   child: Card(
              //     color: Colors.black38,
              //     child: SizedBox(
              //       height: MediaQuery.of(context).size.height * 0.0005,
              //       width: MediaQuery.of(context).size.width,
              //       child: Column(
              //         children: <Widget>[
              //           ElevatedButton(
              //             style: ButtonStyle(
              //                 backgroundColor: MaterialStateProperty.all(
              //                     Colors.green.shade800),
              //                 padding: MaterialStateProperty.all(
              //                     const EdgeInsets.all(20)),
              //                 textStyle: MaterialStateProperty.all(
              //                     const TextStyle(
              //                         fontSize: 18,
              //                         fontWeight: FontWeight.w700,
              //                         color: Colors.white))),
              //             onPressed: () {},
              //             child: const Text("PROCEED FOR PAYMENT"),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
