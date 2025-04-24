class ProductModel {
  final String? tier;
  final String name;
  final String category;
  final String description;
  final double price;
  final List<String> images;
  final double? discountPrice;
  final double rating;
  final String sellersName;
  final String sellersAddress;
  final String sellersImage;

  ProductModel({
    this.tier,
    this.discountPrice,
    required this.name,
    required this.description,
    required this.price,
    required this.images,
    required this.category,
    required this.rating,
    required this.sellersAddress,
    required this.sellersImage,
    required this.sellersName,
  });

  // Factory constructor to create a Product object from JSON
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      tier: json['tier'],
      name: json['name'],
      description: json['description'] ?? '',
      images: json['images'],
      price: json['price'].toDouble(),
      discountPrice: json['discountPrice'].toDouble(),
      category: json['category'],
      rating: json['rating'].toDouble(),
      sellersAddress: json['sellersAddress'],
      sellersImage: json['sellersImage'],
      sellersName: json['sellersName'],
    );
  }
}
