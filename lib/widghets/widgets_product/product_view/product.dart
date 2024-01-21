
class Product {
  late final String name;

  late final String ImgUrl;
  final double ? price;


  Product(  {
    this.price,
    required this.name,
    required this.ImgUrl,
});
}