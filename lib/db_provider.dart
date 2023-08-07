import 'package:flutter_local_database/product_db_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static Database? _database;

  static Future<Database> get database async {
    //  get database path is used to fetch the current location of the database
    String directoryPath = await getDatabasesPath();
    //  join is used to make the complete path including the current location and the database name
    // join is used to join the path's
    String path = join(directoryPath, "Product.db");
    return _database ??
        await openDatabase(
          path,
          version: 1,
          onCreate: (db, version) {
            db.execute(ProductDBProvider.createTable);
          },
        );
  }
}
