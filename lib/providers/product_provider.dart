import 'package:flutter/material.dart';

import 'server_end_product_view.dart';

class ProductProvider with ChangeNotifier {
  final List<Product> _items = [
    Product(
        Product_Id: '101',
        Product_name: 'Autum Shoes',
        Product_description: 'Casual Shoes',
        Product_price: 799.00,
        image_url:
            'https://www.dhresource.com/0x0/f2/albu/g8/M01/AF/01/rBVaVF5ypgiAFEJKAAdsxe3EEws561.jpg'),
    Product(
        Product_Id: '102',
        Product_name: 'shoes',
        Product_description: 'adidas',
        Product_price: 899.00,
        image_url:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0KLpxgwL764PoPBlZbwqdelC3QdM7Xx_w3Q&usqp=CAU'),
    Product(
        Product_Id: '103',
        Product_name: 'Z-High shoe',
        Product_description: 'KOR',
        Product_price: 1299.00,
        image_url:
            'https://i.pinimg.com/736x/88/74/e7/8874e7a0aace168049eafde28427ce8f.jpg'),
    Product(
        Product_Id: '104',
        Product_name: 'Adidas Shoes',
        Product_description: 'Adidas',
        Product_price: 875.00,
        image_url:
            'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/09c5ea6df1bd4be6baaaac5e003e7047_9366/Forum_Low_Shoes_White_FY7756_01_standard.jpg'),
    Product(
        Product_Id: '105',
        Product_name: 'Jordan Shoes',
        Product_description: 'Jordan',
        Product_price: 999.00,
        image_url:
            'https://rukminim1.flixcart.com/image/450/500/xif0q/shoe/t/z/c/8-ozz4-8-laststep-black-original-imageyhgkg56xrff-bb.jpeg?q=90&crop=false'),
    Product(
        Product_Id: '106',
        Product_name: 'Girl-Jordan',
        Product_description: 'Jordan Shoes',
        Product_price: 2983.00,
        image_url:
            'https://images.complex.com/complex/images/c_scale,f_auto,q_auto,w_1920/fl_lossy,pg_1/n9mhxly6ltmwiinrmzu5/wmns-air-jordan-1-retro-high-atmpsphere-lead?fimg-ssr-default'),
    Product(
        Product_Id: '107',
        Product_name: 'Shoes',
        Product_description: 'Jordans',
        Product_price: 789.00,
        image_url:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6DQJZD1kZfisIsHHkTAmos3QSd1_eHOQq6Q&usqp=CAU'),
    Product(
        Product_Id: '108',
        Product_name: 'Girls-Nike-Wear',
        Product_description: 'Nike',
        Product_price: 1389.00,
        image_url:
            'https://www.highsnobiety.com/static-assets/thumbor/LDHAQ2_l0uNclEe7CY2aASE96Jc=/1200x800/www.highsnobiety.com/static-assets/wp-content/uploads/2021/01/15142607/valuable-Jordan-sneakers-ebay-main1.jpg'),
  ];

  List<Product> shoppingCartItems = [];

  bool showFavorites = false;

  get length => Product.length;

  void toggleShowFavorite(bool value) {
    showFavorites = value;
    notifyListeners();
  }


  List<Product> get items {
    return _items;
  }

  List<Product> get favoriteItems {
    return showFavorites
        ? _items.where((ProdItem) => ProdItem.isFavorite).toList()
        : _items;
  }

  void addProducts(Product newProduct) {
    _items.add(newProduct);
    notifyListeners();
  }

  Product? findById(String ProductId) {
    if (_items.isNotEmpty) {
      return _items.firstWhere((prod) => prod.Product_Id == ProductId);
    }
  }

  void toggleFavorite(int index){
    Product newProduct =  Product(
        Product_Id: _items[index].Product_Id,
        Product_name: _items[index].Product_name,
        Product_description: _items[index].Product_description,
        Product_price: _items[index].Product_price,
        image_url:
        _items[index].image_url, isFavorite: !_items[index].isFavorite);
    _items.replaceRange(index, index + 1, [newProduct]);
    notifyListeners();
  }

  void addProductToCart(Product product) {
    shoppingCartItems.add(product);
    shoppingCartItems.toSet().toList();
    notifyListeners();
  }
}

// if (showFavorites){
// return _items.where((ProdItem) => ProdItem.isFavorite).toList();
// }
