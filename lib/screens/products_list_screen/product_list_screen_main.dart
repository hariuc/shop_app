import 'package:flutter/material.dart';
import 'package:shop_app/screens/favorites_product/favorites_product_main_screen.dart';
import 'package:shop_app/screens/products_list_screen/widgets/panel_filtres_widget.dart';
import 'package:shop_app/screens/products_list_screen/widgets/product_list_widget.dart';
import 'package:shop_app/services/constants.dart';
import 'package:shop_app/widgets/button_cart/button_my_cart_widget.dart';

class ProductListScreenMain extends StatelessWidget {
  const ProductListScreenMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: _createAppBar(context),
        body: _createBody(),
      );

  AppBar _createAppBar(BuildContext context) => AppBar(
        title: Text(''),
        centerTitle: true,
        leading: Icon(Icons.person),
        backgroundColor: Color(Constants.mainColor),
        actions: [
          IconButton(
              onPressed: () => _navigateToFavoritProducts(context: context),
              icon: Icon(Icons.favorite_outline)),
        ],
      );

  Widget _createBody() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _createFiltreWidget(),
          _createProductList(),
          _createCartButton(),
        ],
      );

  //Widget _createHeader() => Row();

  Widget _createFiltreWidget() => PanelFiltresWidget();

  Widget _createCartButton() => Expanded(flex: 1, child: ButtonMyCartWidget());

  Widget _createProductList() =>
      Expanded(flex: 7, child: const ProductListWidget());

  Future<void> _navigateToFavoritProducts(
      {required BuildContext context}) async {
    var route =
        MaterialPageRoute(builder: (context) => FavoritesProductMainScreen());
    await Navigator.push(context, route);
  }
}
