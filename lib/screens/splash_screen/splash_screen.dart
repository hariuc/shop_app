import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shop_app/services/constants.dart';

class SplashScreen extends StatefulWidget {
  final String shopApp;

  const SplashScreen({required this.shopApp, Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3),
        () => Navigator.of(context).pushReplacementNamed(widget.shopApp));
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: const Color(Constants.mainColor),
        body: Center(
          child: Text('WOW'),
        ),
      );
}
