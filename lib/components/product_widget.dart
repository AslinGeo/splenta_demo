import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:sample_project/modal/product.dart';

class ProductWidget extends StatelessWidget {
  final Rx<Product> product;

  ProductWidget({super.key, required this.product});

  Widget build(BuildContext context) {
    return Obx(() => Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.network(
                product.value.image,
                width: 200,
                height: 200,
              ),
              const SizedBox(height: 16.0),
              Text(
                product.value.name,
                style: const TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              Text(
                '\$${product.value.price.toStringAsFixed(2)}',
                style: const TextStyle(
                    fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () {
                      if (product.value.quantity > 1) {
                        product.update((val) {
                          product.value.quantity--;
                        });
                      }
                    },
                  ),
                  Text(product.value.quantity.toString()),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      product.update((val) {
                        product.value.quantity++;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
