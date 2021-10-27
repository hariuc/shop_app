import 'package:flutter/material.dart';

class CommonIndicator extends StatelessWidget {
  const CommonIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Center(
        child: CircularProgressIndicator(),
      );
}

class CommonErrorWidget extends StatelessWidget {
  final String errorText;

  const CommonErrorWidget({required this.errorText});

  @override
  Widget build(BuildContext context) => Center(
        child: Text(errorText),
      );
}
