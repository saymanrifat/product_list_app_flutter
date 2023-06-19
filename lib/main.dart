import 'dart:math';

import 'package:flutter/material.dart';

import 'list_item/items.dart';

void main() {
  runApp(BaseApp());
}

class BaseApp extends StatelessWidget {
  const BaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductList(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  int quantity = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        separatorBuilder: (context, index) {
          return const Divider();
        },
        itemCount: ProductItems.productItem.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Text((index + 1).toString()),
            title: Text(capitalize(ProductItems.productItem[index].toString())),
            subtitle: Text("\$${Random().nextInt(100).toString()}.00"),
            trailing: Column(
              children: [
                Text(
                  'Quantity : $quantity',
                  style: TextStyle(fontSize: 12),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Buy Now'),
                  style: ButtonStyle(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                )
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Goto Cart'),
        onPressed: () {},
        icon: const Icon(Icons.shopping_basket),
      ),
    );
  }

  //capitilazation of Sting
  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);
}
