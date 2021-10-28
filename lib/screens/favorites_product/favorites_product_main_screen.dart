import 'package:flutter/material.dart';
import 'package:shop_app/screens/favorites_product/widgets/favorit_list_product.dart';
import 'package:shop_app/screens/favorites_product/widgets/favorit_panel_widget.dart';
import 'package:shop_app/services/constants.dart';
import 'package:shop_app/widgets/button_cart/button_my_cart_widget.dart';

class FavoritesProductMainScreen extends StatelessWidget {
  const FavoritesProductMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: _createAppBar(),
        body: _createBody(),
      );

  AppBar _createAppBar() => AppBar(
        title: Image.asset('assets/img/Logo.png',
        width: 80,
        height: 30,),
        centerTitle: true,
        backgroundColor: Color(Constants.mainColor),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: const Icon(
              Icons.favorite,
              color: Colors.white,
            ),
          ),
        ],
      );

  Widget _createBody() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _createFavoritIndex(),
          _createProductList(),
          _createCartButton(),
        ],
      );

  Widget _createFavoritIndex() => FavoritPanelWidget();

  Widget _createCartButton() => Expanded(flex: 1, child: ButtonMyCartWidget());

  Widget _createProductList() =>
      Expanded(flex: 7, child: const FavoritListProduct());
}
