import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sample_project/components/product_widget.dart';
import 'package:sample_project/home/controller.dart';
import 'package:sample_project/modal/product.dart';

class HomeView extends GetResponsiveView<HomeController> {
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.blueAccent,
        title: const Text("Products"),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Stack(
              children: [
                Image.asset(
                  "asset/shopping-cart.png",
                  width: 50,
                  height: 50,
                ),
                Positioned(
                  right: 0,
                  child: CircleAvatar(
                    backgroundColor:
                        Colors.red, // Background color of the badge
                    radius: 12, // Radius of the badge
                    child: Text(
                      controller.totalQuantity.toString(),
                      style: TextStyle(
                        color: Colors.white, // Color of the count text
                        fontSize: 12, // Font size of the count text
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      body: body(),
    );
  }

  body() {
    return ListView.builder(
        itemCount: controller.products.length,
        itemBuilder: (context, index) {
          return ProductWidget(
            product: controller.products[index],
          );
        });
  }
}
