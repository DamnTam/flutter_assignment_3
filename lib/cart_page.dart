import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key,required this.total});
  int total=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Center(
        child: Text('Total Product: $total',style:const TextStyle(fontSize: 24),),
      ),
    );
  }
}