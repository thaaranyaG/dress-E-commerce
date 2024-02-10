import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_project_4/controllers/details_controller.dart';
import 'package:task_project_4/screens/product%20_list.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({
    super.key,
  });

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  DetailsController detailsController = Get.put(DetailsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_outlined,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text(
          "Cart",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: detailsController.productList.length,
          itemBuilder: (BuildContext context, int index) {
            Products product = detailsController.productList[index];
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 110,
                        height: 110,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            width: 1.2,
                            color: const Color(0xFFf8dddb),
                          ),
                        ),
                        child: Image.asset(
                          product.image,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      const SizedBox(width: 25),
                      Expanded(
                        child: SizedBox(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 10),
                              const SizedBox(height: 10),
                              const Row(
                                children: [
                                  Text(
                                    '\u{20AC}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    '18,00',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}
