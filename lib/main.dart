import 'package:flutter/material.dart';
import 'package:product_list_app_flutter/screens/product_list.dart';

void main() {
  runApp(const BaseApp());
}

class BaseApp extends StatelessWidget {
  const BaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ProductList(),
      debugShowCheckedModeBanner: false,
    );
  }
}
