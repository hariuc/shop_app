import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/services/repository.dart';

class ProductDBBloc extends Bloc<ProductFavoritEvent, ProductFavoritState> {
  final Repository repository;

  ProductDBBloc({required this.repository})
      : super(ProductFavoritLoadingState());

  @override
  Stream<ProductFavoritState> mapEventToState(
      ProductFavoritEvent event) async* {
    yield ProductFavoritLoadingState();

    if (event is ProductFavoritLoadEvent) {
      try {
        yield ProductFavoritLoadedState(
            productList: await repository.getAllFavoritProducts());
      } catch (e) {
        yield ProductFavoritErrorState();
      }
    }

    if (event is ProductFavoritAddEvent) {
      try {
        await repository.insertProduct(event.product);

        yield ProductFavoritLoadedState(
            productList: await repository.getAllFavoritProducts());
      } catch (e) {
        yield ProductFavoritErrorState();
      }
    }

    if (event is ProductFavoritDeleteEvent) {
      try {
        await repository.deleteProduct(event.product);
        yield ProductFavoritLoadedState(
            productList: await repository.getAllFavoritProducts());
      } catch (e) {
        yield ProductFavoritErrorState();
      }
    }
  }
}

////////////////////////////////////
//Event
///////////////////////////////////
abstract class ProductFavoritEvent {}

class ProductFavoritLoadEvent extends ProductFavoritEvent {}

class ProductFavoritAddEvent extends ProductFavoritEvent {
  final Product product;

  ProductFavoritAddEvent({required this.product});
}

class ProductFavoritDeleteEvent extends ProductFavoritEvent {
  final Product product;

  ProductFavoritDeleteEvent({required this.product});
}

///////////////////////////////////
//State
//////////////////////////////////
abstract class ProductFavoritState {}

class ProductFavoritLoadingState extends ProductFavoritState {}

class ProductFavoritLoadedState extends ProductFavoritState {
  List<Product> productList;

  ProductFavoritLoadedState({required this.productList});
}

class ProductFavoritErrorState extends ProductFavoritState {}
