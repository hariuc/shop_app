import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/services/repository.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  final Repository repository;

  ProductListBloc({required this.repository})
      : super(ProductListLoadingState());

  @override
  Stream<ProductListState> mapEventToState(ProductListEvent event) async* {
    yield ProductListLoadingState();

    if (event is ProductListLoadEvent) {}
  }
}

////////////////////////////////////
//Event
///////////////////////////////////
abstract class ProductListEvent {}

class ProductListLoadEvent extends ProductListEvent {}

///////////////////////////////////
//State
//////////////////////////////////
abstract class ProductListState {}

class ProductListLoadingState extends ProductListState {}

class ProductListLoadedState extends ProductListState {
  final List<dynamic> productList;

  ProductListLoadedState({required this.productList});
}

class ProductListErrorState extends ProductListState {}
