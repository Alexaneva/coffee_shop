import 'category.dart';

class Product {
  final String image, name;
  final double price;
  final Category category;

  Product(
      {required this.image,
      required this.name,
      required this.price,
      required this.category});
}

List<Product> products = [
  Product(image: 'assets/images/products/ame.png', name: 'Americano', price: 10, category: categories[0]),
  Product(image: 'assets/images/products/cape.png', name: 'Cupcake', price: 15, category: categories[3]),
  Product(image: 'assets/images/products/capu.png', name: 'Cappuccino', price: 25, category: categories[0]),
  Product(image: 'assets/images/products/cina.png', name: 'Cinnabon', price: 23, category: categories[3]),
  Product(image: 'assets/images/products/cock.png', name: 'Strawberry Cocktail', price: 20, category: categories[1]),
  Product(image: 'assets/images/products/cola.png', name: 'Cola', price: 7, category: categories[1]),
  Product(image: 'assets/images/products/cruas.png', name: "Croissant", price: 10, category: categories[3]),
  Product(image: 'assets/images/products/ess.png', name: 'Espresso', price: 7, category: categories[0]),
  Product(image: 'assets/images/products/juice.png', name: 'Mojito', price: 23, category: categories[1]),
  Product(image: 'assets/images/products/latte.png', name: 'Latte', price: 25, category: categories[0]),
  Product(image: 'assets/images/products/tea.png', name: 'Black tea', price: 10, category: categories[2]),
  Product(image: 'assets/images/products/tea1.png', name: 'Green tea', price: 15, category: categories[2]),
  Product(image: 'assets/images/products/tea2.png', name: 'Fruit tea', price: 15, category: categories[2]),
];
