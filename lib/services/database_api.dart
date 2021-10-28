import 'package:shop_app/database/database_helper.dart';
import 'package:shop_app/database/product_table_setting.dart';
import 'package:shop_app/models/product.dart';

class DatabaseAPI {
  DatabaseHelper databaseHelper = DatabaseHelper.instance;

  Future<List<Product>> getAllFavoritProducts() async {
    var dbClient = await databaseHelper.database;

    var products = await dbClient.rawQuery(ProductTableSetting.getAllProduct());

    List<Product> productList = products.isNotEmpty
        ? products.map((e) {
            return Product.fromJson(e);
          }).toList()
        : [];
    return productList;
  }

  Future<int> insertProduct(Product product) async {
    var dbClient = await databaseHelper.database;
    return await dbClient.insert(
        ProductTableSetting.tableName, product.toJson());
  }

  Future<int> deleteProduct(Product product) async {
    var dbClient = await databaseHelper.database;
    return await dbClient.delete(ProductTableSetting.tableName,
        where: '${ProductTableSetting.id} = ?', whereArgs: [product.id]);
  }
}
