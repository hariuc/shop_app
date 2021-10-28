import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/blocks/product_db_bloc.dart';
import 'package:shop_app/common_widgets/common_widgets.dart';
import 'package:shop_app/screens/products_list_screen/widgets/product_card.dart';

class FavoritListProduct extends StatefulWidget {
  const FavoritListProduct({Key? key}) : super(key: key);

  @override
  _FavoritListProductState createState() => _FavoritListProductState();
}

class _FavoritListProductState extends State<FavoritListProduct> {

  void initState() {
    BlocProvider.of<ProductDBBloc>(context).add(ProductFavoritLoadEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<ProductDBBloc, ProductFavoritState>(
          builder: (context, state) {
            if (state is ProductFavoritLoadingState) {
              return const CommonIndicator();
            }

            if (state is ProductFavoritLoadedState) {
              return _createFavoritProductList(state: state);
            }

            return const CommonErrorWidget(errorText: 'errorText');
          });

  Widget _createFavoritProductList(
      {required ProductFavoritLoadedState state}) =>
      ListView.builder(
          itemCount: state.productList.length,
          itemBuilder: (context, index) =>
              ProductCard(product: state.productList[index]));

}
