import 'package:shop_app/models/product.dart';
import 'package:shop_app/services/database_api.dart';
import 'package:shop_app/services/product_api.dart';

class Repository {
  final ProductAPI _productAPI = ProductAPI();
  final DatabaseAPI _databaseAPI = DatabaseAPI();

  Future<List<Product>> getProductList() async {
    var mapData = await _productAPI.getProductList();

    var dataList = mapData['results'] as List;

    return dataList.isNotEmpty
        ? dataList.map((e) => Product.fromJson(e)).toList()
        : [];
  }

  Future<Product> getDetailProduct({required int idProduct}) async =>
      Product.fromJson(await _productAPI.getDetailProduct(id: idProduct));

  /////////////////////////////////////////////////////////////////////////////

  Future<List<Product>> getAllFavoritProducts() async =>
      _databaseAPI.getAllFavoritProducts();

  Future<int> insertProduct(Product product) =>
      _databaseAPI.insertProduct(product);

  Future<int> deleteProduct(Product product) =>
      _databaseAPI.deleteProduct(product);
}
