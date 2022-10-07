class Product {
  final String Product_Id;
  final String Product_name;
  final String Product_description;
  final double Product_price;
  final String image_url;

  bool isFavorite;

  static var length;
  int Quantity = 0;

  Product({
    required this.Product_Id,
    required this.Product_name,
    required this.Product_description,
    required this.Product_price,
    required this.image_url,
    this.isFavorite = false,
  });
}
