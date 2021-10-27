import 'package:shop_app/services/utils.dart';

class ProductAPI {
  Future<Map<String, dynamic>> getProductList() async =>
      await Utils.getDataFromServer(uriPath: 'products');

  Future<Map<String, dynamic>> getDetailProduct({required int id}) async =>
      await Utils.getDataFromServer(uriPath: 'products/'+ id.toString());

       
}
