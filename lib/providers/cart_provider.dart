import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
  final List<CartItem> _Identity = [];

  List<CartItem> get Identity {
    return _Identity;
  }

  // void removeCartItem(String id) {
  //   Items.remove(id);
  //   notifyListeners();
  // }

  void removeSingleItem(String id) {
    print("Items length: ${Items.length}");
    if (!Items.containsKey(id)) {
      return;
    }
    if (Items[id]!.quantity > 1) {
      Items.update(id, (Identity) => CartItem(Identity.product, 1, () {}));
    } else {
      Items.remove(id);
    }
    print("Items length: ${Items.length}");
    notifyListeners();
  }
}
