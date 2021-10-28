import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/blocks/detail_product_bloc.dart';
import 'package:shop_app/common_widgets/common_widgets.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/widgets/product_card_widgets/price_product.dart';
import 'package:shop_app/widgets/product_card_widgets/subtitle_product.dart';
import 'package:shop_app/widgets/product_card_widgets/title_product.dart';

class BodyWidget extends StatefulWidget {
  final Product product;

  const BodyWidget({required this.product, Key? key}) : super(key: key);

  @override
  _BodyWidgetState createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  @override
  void initState() {
    BlocProvider.of<DetailProductBloc>(context)
        .add(DetailProductLoadEvent(idProduct: widget.product.id!));
    super.initState();
  }

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<DetailProductBloc, DetailProductState>(
          builder: (context, state) {
        if (state is DetailProductLoadingState) {
          return const CommonIndicator();
        }

        if (state is DetailProductLoadedState) {
          return _createDetailProduct(state: state);
        }

        return const CommonErrorWidget(errorText: 'errorText');
      });

  Widget _createDetailProduct({required DetailProductLoadedState state}) =>
      Column(
        children: [
          _createImageViews(detailProduct: state.product),
          Expanded(
            flex: 4,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _createDivider(),
                  Center(
                    child: Column(
                      children: [
                        TitleProduct(product: widget.product, fontSize: 20),
                        const SizedBox(
                          height: 10,
                        ),
                        SubtitleProduct(product: widget.product, fontSize: 12),
                        const SizedBox(
                          height: 10,
                        ),
                        PriceProduct(
                            product: widget.product,
                            fontSize1: 16,
                            fontSize2: 11),
                      ],
                    ),
                  ),
                  _createDivider(),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 24, bottom: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('INFORMATION',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                                color: Color(0xFF07195C))),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
                            style: TextStyle(fontSize: 12.0),
                          ),
                        ),
                        _createDivider(),
                        _createTextElement(
                            str:
                                'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                            liStr: '-'),
                        const SizedBox(
                          height: 24,
                        ),
                        _createTextElement(
                            str:
                                'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.',
                            liStr: '-'),
                        const SizedBox(
                          height: 24,
                        ),
                        _createTextElement(
                            str:
                                'Nemo enim ipsam voluptatem quia voluptas it	aspernatur aut odit aut fugit, sed quia consequuntur	magni dolores eos qui ratione voluptatem sequi	nesciunt.',
                            liStr: '-'),
                        const SizedBox(
                          height: 24,
                        ),
                        _createTextElement(
                            str:
                                'Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur.',
                            liStr: '-'),
                        const SizedBox(
                          height: 24,
                        ),
                        _createTextElement(
                            str:
                                'Adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.',
                            liStr: '-'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          _createButtonPanel(),
        ],
      );

  Widget _createTextElement({required String str, required String liStr}) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            liStr,
            style: const TextStyle(fontSize: 12),
          ),
          const SizedBox(
            width: 30,
          ),
          Expanded(
            child: Text(
              str,
              style: const TextStyle(fontSize: 12),
            ),
          ),
        ],
      );

  Widget _createImageViews({required Product detailProduct}) => SizedBox(
      height: 310,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Image.network(detailProduct.images!.elementAt(0).image),
          Image.network(detailProduct.images!.elementAt(0).image),
          Image.network(detailProduct.images!.elementAt(0).image),
        ],
      ));

  /*Widget _createImageViews({required Product detailProduct}) => SizedBox(
        height: 290,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: detailProduct.images?.length,
            itemBuilder: (contex, index) {
              return Image.network(
                  detailProduct.images!.elementAt(index).image);
            }),
      );*/

  Widget _createDivider() => const Divider();

  Widget _createButtonPanel() => Expanded(
      flex: 1,
      child: Padding(
        padding:
            const EdgeInsets.only(right: 16, left: 16, top: 12, bottom: 12),
        child: Row(
          children: [
            Expanded(
                child: _createButton('ADD TO CART', const Color(0xFF182867))),
            const SizedBox(
              width: 8,
            ),
            Expanded(child: _createButton('BUY NOW', const Color(0xFF7740A2))),
          ],
        ),
      ));

  Widget _createButton(String btnTitle, Color color) => InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.all(Radius.circular(2.0))),
          child: Center(
            child: Text(
              btnTitle,
              style: const TextStyle(color: Color(0xFFFFFFFF)),
            ),
          ),
        ),
      );
}
