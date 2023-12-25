import 'package:animation/model/product_model.dart';

class ProductList {
  List<Product> product = [
    Product(
        id: 1,
        name: "NIKE AIR MAX 200",
        category: "shoe",
        price: 240.00,
        isliked: true,
        isSelected: false,
        image: "assets/product/shooe_tilt_1.png"),
    Product(
        id: 2,
        name: "NIKE AIR MAX 97",
        category: "shoe",
        price: 220.00,
        isliked: false,
        isSelected: false,
        image: "assets/product/shoe_tilt_2.png"),
    Product(
        id: 1,
        name: "NIKE AIR MAX 145",
        category: "shoe",
        price: 200.00,
        isliked: false,
        isSelected: false,
        image: "assets/product/small_tilt_shoe_3.png"),
  ];
}
