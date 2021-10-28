import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/blocks/product_db_bloc.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/services/constants.dart';
import 'package:http/http.dart' as http;

class Utils {
  static Map<String, String> getHeaders() => {
        HttpHeaders.acceptCharsetHeader: 'application/json;utf-8',
        HttpHeaders.acceptEncodingHeader: 'utf-8',
      };

  static Future<Map<String, dynamic>> getDataFromServer(
      {required String uriPath}) async {
    final response = await http.get(Uri.parse(Constants.serverPath + uriPath),
        headers: getHeaders());
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Exception');
    }
  }

  static void addProductInFavorit(
      {required BuildContext context, required Product product}) {
    BlocProvider.of<ProductDBBloc>(context)
        .add(ProductFavoritAddEvent(product: product));
    productFavoritList.add(product);
  }

  static void deleteProductFromFavorit(
      {required BuildContext context, required Product product}) {
    BlocProvider.of<ProductDBBloc>(context)
        .add(ProductFavoritDeleteEvent(product: product));
    if (productFavoritList.isNotEmpty) {
      productFavoritList.remove(product);
    }
  }

  static void workWithAddOrDeleteProductFavorite(
      {required BuildContext context, required Product product}) {
    if (productIsFavorit(product: product)) {
      deleteProductFromFavorit(context: context, product: product);
    } else {
      addProductInFavorit(context: context, product: product);
    }
  }

  static Color? getIconColor({required Product product}) =>
      productIsFavorit(product: product) ? Color(0xFFE3453A) : null;

  static bool productIsFavorit({required Product product}) => productFavoritList
          .where((element) => element.id == product.id)
          .toList()
          .isNotEmpty
      ? true
      : false;

  static List<Product> productFavoritList = [];
}
