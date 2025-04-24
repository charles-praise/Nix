class ProductModel {
  final String? tier;
  final String name;
  final String description;
  final double price;
  final String image;

  ProductModel({
    this.tier,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });

  // Factory constructor to create a Product object from JSON
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      tier: json['tier'],
      name: json['name'],
      description: json['description'] ?? '',
      image: json['image'],
      price: json['price'].toDouble(),
    );
  }
}
