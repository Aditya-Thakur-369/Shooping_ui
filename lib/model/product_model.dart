// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Product {
  int id;
  String name;
  String category;
  String image;
  double price;
  bool isliked;
  bool isSelected;
  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.isliked,
    required this.isSelected,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'category': category,
      'image': image,
      'price': price,
      'isliked': isliked,
      'isSelected': isSelected,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as int,
      name: map['name'] as String,
      category: map['category'] as String,
      image: map['image'] as String,
      price: map['price'] as double,
      isliked: map['isliked'] as bool,
      isSelected: map['isSelected'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) => Product.fromMap(json.decode(source) as Map<String, dynamic>);
}
