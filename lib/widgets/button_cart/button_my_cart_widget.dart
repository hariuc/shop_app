import 'package:flutter/material.dart';

class ButtonMyCartWidget extends StatelessWidget {
  const ButtonMyCartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => _createCartButton();

  Widget _createCartButton() => InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(flex: 1, child: _createPartLeftOfButton()),
            Expanded(flex: 5, child: _createCenterPartOfButton()),
            Expanded(flex: 1, child: _createPartRigthOfButton())
          ],
        ),
      ));

  Widget _createPartLeftOfButton() => Container(
        child: const Icon(Icons.shopping_cart),
        height: 40,
        decoration: const BoxDecoration(
            color: Color(0xFF7740A2),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4), bottomLeft: Radius.circular(4))),
      );

  Widget _createCenterPartOfButton() => Container(
        color: const Color(0xFF7740A2),
        height: 40,
        child: Center(
          child: Text(
            'MY CART',
            style: const TextStyle(fontSize: 13, color: Color(0xFFFFFFFF)),
          ),
        ),
      );

  Widget _createPartRigthOfButton() => Container(
        height: 40,
        child: Padding(
          padding: const EdgeInsets.all(9.0),
          child: Container(
            width: 24,
            height: 24,
            child: Center(
                child: Text(
              '3',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            )),
            decoration: BoxDecoration(
              color: const Color(0xFFFFFFFF),
              shape: BoxShape.circle,
            ),
          ),
        ),
        decoration: BoxDecoration(
            color: Color(0xFF7740A2),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(4), bottomRight: Radius.circular(4))),
      );
}
