import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';


import '../widgets/cart_grid.dart';
class Cart {
  String id;
  int quantity;
  String name;
  double price;


  Cart({
    required this.id,
    required this.quantity,
    required this.name,
    required this.price,
  });



}
  class CartProvider with ChangeNotifier {

    Map<String, CartItem> Items = {};
    List<CartItem> _Identity = [];

    List<CartItem> get Identity {
      return _Identity;
    }


    // void removeCartItem(String id) {
    //   Items.remove(id);
    //   notifyListeners();
    // }

    void removeSingleItem(String id){
      if(!Items.containsKey(id)){
        return;
      }
      if(Items[id]!.quantity >1){
        Items.update(id, (Identity) => CartItem(Identity.id, Identity.price, Identity.name, Identity.quantity-1, Identity.image));
      }
      else{
        Items.remove(id);
      }
      notifyListeners();
    }

    
  }
