import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/services/repository.dart';


enum FavoritCountEvent {
  event1,
  event2,
}

class FavoritCountBloc extends Bloc<FavoritCountEvent, int> {
  Repository repository;
  FavoritCountBloc({required this.repository}) : super(0);
  @override
  Stream<int> mapEventToState(FavoritCountEvent event) async* {
    if (event == FavoritCountEvent.event1 || event == FavoritCountEvent.event2) { 
      final list = await repository.getAllFavoritProducts();
      yield list.length;
    }
  }
}
