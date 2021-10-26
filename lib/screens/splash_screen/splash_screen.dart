import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  final String shopApp;

  const SplashScreen({required this.shopApp, Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 2),
        () => Navigator.of(context).pushReplacementNamed(widget.shopApp));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Splash screen'),
    );
  }
}
