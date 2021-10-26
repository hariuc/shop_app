import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/services/repository.dart';

class DetailProductBloc extends Bloc<DetailProductEvent, DetailProductState> {
  final Repository repository;

  DetailProductBloc({required this.repository})
      : super(DetailProductLoadingState());

  @override
  Stream<DetailProductState> mapEventToState(DetailProductEvent event) async* {
    yield DetailProductLoadingState();
    if (event is DetailProductLoadEvent) {
      try {} catch (e) {
        DetailProductErrorState();
      }
    }
  }
}

////////////////////////////////////
//Event
///////////////////////////////////
abstract class DetailProductEvent {}

class DetailProductLoadEvent extends DetailProductEvent {
  final int idProduct;

  DetailProductLoadEvent({required this.idProduct});
}

///////////////////////////////////
//State
//////////////////////////////////
abstract class DetailProductState {}

class DetailProductLoadingState extends DetailProductState {}

class DetailProductLoadedState extends DetailProductState {
  final product;

  DetailProductLoadedState({required this.product});
}

class DetailProductErrorState extends DetailProductState {}
