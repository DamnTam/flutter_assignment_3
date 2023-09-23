import 'package:flutter/material.dart';
import 'package:flutter_assignment_3/product_brain.dart';

import 'cart_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.blue,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
      ),
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({super.key});
  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  ProductBrain productBrain = ProductBrain();
  int x = 0;
  Map<int, int> cnt = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: productBrain.productList.length,
                itemBuilder: (context, index) {
                  if (cnt.containsKey(index)==false) {
                    cnt[index] = 0;
                  }
                  return Container(
                    //color: Colors.green,
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          //mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              productBrain.productList[index].productName,
                              style: const TextStyle(fontSize: 20),
                            ),
                            Text(
                                '\$${productBrain.productList[index].productPrice.toStringAsFixed(2)}'),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Counter: ${cnt[index]}',
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(
                              height: 27,
                              child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      cnt[index]=cnt[index]!+1;
                                      x++;
                                      if (cnt[index] == 5) {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              actionsPadding: const EdgeInsets.only(top: 10),
                                              title: const Text('Congratulations!'),
                                              content: Text(
                                                  "You've bought ${cnt[index]} ${productBrain.productList[index].productName}!"),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context)
                                                        .pop(); // Close the dialog
                                                  },
                                                  child: const Text('OK',style: TextStyle(fontSize: 18),),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      }
                                    });
                                  },
                                  child: const Text('Buy Now')),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CartPage(
                          total: x,
                        )));
          },
          child: const Icon(Icons.shopping_cart),
        ),
      ),
    );
  }
}
