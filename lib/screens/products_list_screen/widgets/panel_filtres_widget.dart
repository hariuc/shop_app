import 'package:flutter/material.dart';

class PanelFiltresWidget extends StatelessWidget {
  const PanelFiltresWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: SizedBox(
          width: double.infinity,
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _createLeftSizeWidgets(),
              _createRigthSizeWidgets()
            ],
          ),
        ),
      );

  Widget _createLeftSizeWidgets() => Row(
        children: [
          _createFiltreButton(),
          const SizedBox(
            width: 8,
          ),
          _createTextFilters(),
        ],
      );

  Widget _createRigthSizeWidgets() => Row(
        children: [
          _createListViewButton(),
          const SizedBox(
            width: 12,
          ),
          _createGridViewButton(),
        ],
      );

  Widget _createListViewButton() => IconButton(
        icon: Icon(
          Icons.list_rounded,
          size: 31.0,
        ),
        onPressed: () {},
      );

  Widget _createGridViewButton() => IconButton(
        icon: Icon(
          Icons.grid_view_outlined,
          size: 31,
        ),
        onPressed: () {},
      );

  Widget _createFiltreButton() => IconButton(
        icon: Icon(
          Icons.category,
          size: 16.0,
        ),
        onPressed: () {},
      );
  Widget _createTextFilters() => const Text(
        'FILTERS',
        style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Color(0xFF182867)),
      );
}
