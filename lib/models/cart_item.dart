class CartItem {
  CartItem(
      {required this.id,
      required this.image,
      required this.name,
      required this.price,
      required this.amount,
      required this.category});

  int id;
  String name;
  String image;
  int amount;
  String category;

  double price;
}
