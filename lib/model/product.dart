class Product {
  String id;
  String name;
  String description;
  String imageUrl;
  double price;
  String quantity;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.quantity,
  });

  factory Product.fromMap(Map<String, dynamic> data, String documentId) {
    return Product(
      id: documentId,
      name: data['name'],
      description: data['description'],
      imageUrl: data['imageUrl'],
      price: (data['price'] as num).toDouble(),
      quantity: data['quantity'],
    );
  }
}
