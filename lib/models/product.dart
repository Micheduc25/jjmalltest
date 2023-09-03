class Product {
  Product(
      {required this.id,
      required this.title,
      required this.price,
      required this.image,
      required this.isFavorite});
  String id;
  String title;
  String image;
  bool isFavorite;
  double price;
}
