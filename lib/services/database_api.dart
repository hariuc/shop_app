import 'package:shop_app/database/database_helper.dart';
import 'package:shop_app/database/product_table_setting.dart';
import 'package:shop_app/models/product.dart';

class ProductDatabaseAPI {
  DatabaseHelper databaseHelper = DatabaseHelper.instance;

  Future<List<Product>> getAllFavoritFilmTopResponse() async {
    var dbClient = await databaseHelper.database;

    var films = await dbClient.rawQuery(ProductTableSetting.getAllProduct());

    List<Product> filmsList = films.isNotEmpty
        ? films.map((e) {
            return Product.fromJson(e);
          }).toList()
        : [];
    return filmsList;
  }

  Future<int> insertFilm(Product product) async {
    var dbClient = await databaseHelper.database;
    return await dbClient.insert(ProductTableSetting.tableName, product.toJson());
  }

  Future<int> deleteFilm(Product product) async {
    var dbClient = await databaseHelper.database;
    return await dbClient.delete(ProductTableSetting.tableName,
        where: '${ProductTableSetting.id} = ?', whereArgs: [product.id]);
  }
}
