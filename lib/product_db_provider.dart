import 'package:flutter_local_database/db_provider.dart';
import 'package:flutter_local_database/product_model.dart';
import 'package:sqflite/sqflite.dart';

class ProductDBProvider {
  static const String tableName = "Product";
  static const String keyProductId = "productId";
  static const String productName = "productName";
  static const String product_image = "productImage";
  static const String product_price = "productPrice";

  static const String createTable =
      "CREATE TABLE $tableName($productName TEXT,$keyProductId INTEGER PRIMARY KEY,$product_image TEXT,$product_price INTEGER)";

  Future<bool> insertProduct({required Product product}) async {
    Database database = await DBProvider.database;
    int rowId = await database.insert(tableName, product.toMap());
    return rowId == 1;
  }

  Future<List<Product>> fetchProducts() async {
    Database database = await DBProvider.database;
    List<Map<String, dynamic>> data = await database.query(tableName);
    return data.map((e) => Product.fromMap(e)).toList();
  }

  Future<bool> deleteProduct({required int productId}) async {
    Database database = await DBProvider.database;
    productId = await database
        .delete(tableName, where: "$keyProductId = ?", whereArgs: [productId]);
    print(productId);
    return productId > 0;
  }

  Future<bool> update({required Product product}) async {
    Database database = await DBProvider.database;
    int rowId = await database.update(tableName, product.toMap(),
        where: "$keyProductId = ?", whereArgs: [product.productId]);
    return rowId == 1;
  }
}
