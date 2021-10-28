import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/blocks/favorit_count_bloc.dart';

class FavoritPanelWidget extends StatefulWidget {
  const FavoritPanelWidget({Key? key}) : super(key: key);

  @override
  State<FavoritPanelWidget> createState() => _FavoritPanelWidgetState();
}

class _FavoritPanelWidgetState extends State<FavoritPanelWidget> {

  @override
  void initState() {
    BlocProvider.of<FavoritCountBloc>(context).add(FavoritCountEvent.event1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: double.infinity,
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _createLeftSizeWidgets(),
              _createRigthSizeWidgets(),
            ],
          ),
        ),
      );

  Widget _createLeftSizeWidgets() => Row(
        children: [
          _createTextFilters(),
          const SizedBox(
            width: 8,
          ),
          _createIndicatorFavorit()
        ],
      );

  Widget _createRigthSizeWidgets() => Row(
        children: [
          _createTitleSort(),
          const SizedBox(
            width: 12,
          ),
          _createDropdownButton(),
        ],
      );

  Widget _createTitleSort() => const Text('SORT BY',
      style: TextStyle(
          fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFF182867)));

  Widget _createDropdownButton() => DropdownButton<String>(
        items: <String>['A', 'B', 'C']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      );

  Widget _createFiltreButton() => IconButton(
        icon: Icon(
          Icons.category,
          size: 16.0,
        ),
        onPressed: () {},
      );

  Widget _createTextFilters() => const Text(
        'FAVORITES',
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: Color(0xFF182867)),
      );

  Widget _createIndicatorFavorit() =>
      BlocBuilder<FavoritCountBloc, int>(builder: (context, state) {
        return Container(
          width: 19,
          height: 19,
          child: Center(
              child: Text(
            '$state',
            style: TextStyle(color: Colors.white),
          )),
          decoration: BoxDecoration(
            color: const Color(0xFFE3453A),
            shape: BoxShape.circle,
          ),
        );
      });
}
