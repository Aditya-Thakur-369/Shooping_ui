// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ShoesSize {
  int id;
  String Size;
  ShoesSize({
    required this.id,
    required this.Size,
  });
 

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'Size': Size,
    };
  }

  factory ShoesSize.fromMap(Map<String, dynamic> map) {
    return ShoesSize(
      id: map['id'] as int,
      Size: map['Size'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ShoesSize.fromJson(String source) => ShoesSize.fromMap(json.decode(source) as Map<String, dynamic>);
}
