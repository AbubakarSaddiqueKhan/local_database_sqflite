// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Product {
  int productId;
  String productName;
  String productImage;
  num productPrice;
  Product({
    required this.productId,
    required this.productName,
    required this.productImage,
    required this.productPrice,
  });

  Product copyWith({
    int? productId,
    String? productName,
    String? productImage,
    num? productPrice,
  }) {
    return Product(
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      productImage: productImage ?? this.productImage,
      productPrice: productPrice ?? this.productPrice,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productId': productId,
      'productName': productName,
      'productImage': productImage,
      'productPrice': productPrice,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      productId: map['productId'] as int,
      productName: map['productName'] as String,
      productImage: map['productImage'] as String,
      productPrice: map['productPrice'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Product(productId: $productId, productName: $productName, productImage: $productImage, productPrice: $productPrice)';
  }

  @override
  bool operator ==(covariant Product other) {
    if (identical(this, other)) return true;

    return other.productId == productId &&
        other.productName == productName &&
        other.productImage == productImage &&
        other.productPrice == productPrice;
  }

  @override
  int get hashCode {
    return productId.hashCode ^
        productName.hashCode ^
        productImage.hashCode ^
        productPrice.hashCode;
  }
}
