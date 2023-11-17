class Food {
  final String id;
  final String name;
  final String image;
  final String price;

  Food({required this.id, required this.name, required this.image, required this.price});
  

  @override
  String toString() {
    return 'Todo{id: $id, name: $name, image: $image, price: $price}';
  }
}