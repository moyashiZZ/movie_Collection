import 'package:flutter/material.dart';

class Margin extends StatelessWidget {
  const Margin({super.key, required this.margin});

  final double margin;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(bottom: margin));
  }
}
