import 'package:flutter/material.dart';
import 'package:shop_app/screens/products_list_screen/widgets/product_list_widget.dart';
import 'package:shop_app/widgets/button_cart/button_my_cart_widget.dart';

class ProductListScreenMain extends StatelessWidget {
  const ProductListScreenMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: _createAppBar(),
        body: _createBody(),
      );

  AppBar _createAppBar() => AppBar(
        title: Text('Hello'),
        centerTitle: true,
        leading: Icon(Icons.person),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.favorite_outline)),
        ],
      );

  Widget _createBody() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _createProductList(),
          _createCartButton(),
        ],
      );

  //Widget _createHeader() => Row();

  Widget _createCartButton() => Expanded(flex: 1, child: ButtonMyCartWidget());

  Widget _createProductList() =>
      Expanded(flex: 8, child: const ProductListWidget());
}
