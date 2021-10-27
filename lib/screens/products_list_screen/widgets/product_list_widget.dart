import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/blocks/product_list_bloc.dart';
import 'package:shop_app/common_widgets/common_widgets.dart';
import 'package:shop_app/screens/products_list_screen/widgets/product_card.dart';

class ProductListWidget extends StatefulWidget {
  const ProductListWidget({Key? key}) : super(key: key);

  @override
  _ProductListWidgetState createState() => _ProductListWidgetState();
}

class _ProductListWidgetState extends State<ProductListWidget> {
  @override
  void initState() {
    BlocProvider.of<ProductListBloc>(context).add(ProductListLoadEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<ProductListBloc, ProductListState>(builder: (context, state) {
        if (state is ProductListLoadingState) {
          return const CommonIndicator();
        }

        if (state is ProductListLoadedState) {
          return _createProductList(state: state);
        }

        return const CommonErrorWidget(errorText: 'errorText');
      });

  Widget _createProductList({required ProductListLoadedState state}) =>
      ListView.builder(
          itemCount: state.productList.length,
          itemBuilder: (context, index) =>
              ProductCard(product: state.productList[index]));
}
