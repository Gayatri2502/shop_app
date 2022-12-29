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

  //from JSON
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      Product_Id: json['Product_Id'],
      Product_name: json['Product_name'],
      Product_description: json['Product_description'],
      Product_price: double.parse(json['Product_price'].toString()),
      image_url: json['image_url'],
    );
  }

  //to JSON
  Map<String, dynamic> toJson() => {
        'Product_Id': Product_Id,
        'Product_name': Product_name,
        'Product_description': Product_description,
        'Product_price': Product_price,
        'image_url': image_url,
      };
}
