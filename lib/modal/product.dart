class Product {
  final String name;
  final String image;
  final double price;
  int quantity;

  Product({
    required this.name,
    required this.image,
    required this.price,
    this.quantity = 0, // Default quantity is 0
  });
}
