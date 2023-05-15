class Product {
  final String name;
  final String image;
  final double price;
  final String description;

  Product({
    required this.name,
    required this.image,
    required this.price,
    required this.description,
  });

  factory Product.fromJson(dynamic json) => Product(
        name: json['name'],
        image: json['image_url'],
        price: double.parse(json['price']),
        description: json['description'],
      );
}
