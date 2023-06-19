import 'package:flutter/material.dart';
import 'package:product_list_app_flutter/screens/cart.dart';

import '../list_item/items.dart';

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
      appBar: AppBar(
        title: const Text('Product List'),
        centerTitle: true,
      ),
      body: ListView.separated(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        separatorBuilder: (context, index) {
          return const Divider();
        },
        itemCount: ProductItems.productItem.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Text((index + 1).toString()),
            title: Text(capitalize(ProductItems.productItem[index].toString())),
            subtitle: Text("\$${ProductItems.productPrice[index]}.00"),
            trailing: Column(
              children: [
                Text(
                  'Quantity : ${ProductItems.productCount[index].toString()}',
                  style: const TextStyle(fontSize: 12),
                ),
                ElevatedButton(
                  onPressed: () {
                    incressProduct(index);
                  },
                  style: const ButtonStyle(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                  child: const Text('Buy Now'),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Goto Cart'),
        onPressed: () {
          int totalSum = 0;
          for (var sValue in ProductItems.productCount) {
            totalSum = totalSum + sValue;
          }

          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CartPage(totalProduct: totalSum),
              ));
        },
        icon: const Icon(Icons.shopping_basket),
      ),
    );
  }

  //capitilazation of Sting
  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

  void incressProduct(int index) {
    if (ProductItems.productCount[index] < 5) {
      ProductItems.productCount[index] = ProductItems.productCount[index] + 1;
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('OK'))
            ],
            title: const Text('Congratulations!'),
            content: Text(
                'You\'ve bought 5 ${capitalize(ProductItems.productItem[index].toString())}'),
          );
        },
      );
    }
    setState(() {});
  }
}
