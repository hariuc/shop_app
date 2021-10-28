import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/blocks/detail_product_bloc.dart';
import 'package:shop_app/blocks/favorit_count_bloc.dart';
import 'package:shop_app/blocks/product_db_bloc.dart';
import 'package:shop_app/blocks/product_list_bloc.dart';
import 'package:shop_app/screens/products_list_screen/product_list_screen_main.dart';
import 'package:shop_app/screens/splash_screen/splash_screen.dart';
import 'package:shop_app/services/constants.dart';
import 'package:shop_app/services/repository.dart';

class ShopApp extends StatelessWidget {
  ShopApp({Key? key}) : super(key: key);

  final repository = Repository();
  final routes = <String, WidgetBuilder>{
    '/ProductListScreenMain': (BuildContext context) => ProductListScreenMain(),
  };

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<ProductListBloc>(
              create: (context) => ProductListBloc(repository: repository)),
          BlocProvider<DetailProductBloc>(
              create: (context) => DetailProductBloc(repository: repository)),
          BlocProvider<ProductDBBloc>(
              create: (context) => ProductDBBloc(repository: repository)),
          BlocProvider<FavoritCountBloc>(
              create: (context) => FavoritCountBloc(repository: repository)),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreen(
            shopApp: '/ProductListScreenMain',
          ),
          routes: routes,
        ),
      );
}
