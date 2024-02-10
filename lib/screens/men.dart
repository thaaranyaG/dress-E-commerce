import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_project_4/screens/product%20_list.dart';
import 'package:task_project_4/screens/screen_2.dart';

class MenProducts extends StatefulWidget {
  const MenProducts({
    Key? key,
  }) : super(key: key);

  @override
  State<MenProducts> createState() => _MenProductsState();
}

class _MenProductsState extends State<MenProducts> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 100;
    var height = MediaQuery.of(context).size.height / 100;
    return GridView.builder(
        primary: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
            mainAxisExtent: height * 28,
            crossAxisSpacing: width * 4.5,
            mainAxisSpacing: width * 5),
        itemCount: mensProducts.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (BuildContext context, index) {
          final product = mensProducts[index];
          return InkWell(
            onTap: () {
              Get.to(() => DetailsScreen(
                    products: product,
                  ));
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 170,
                  width: 165,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.orange.shade50,
                  ),
                  child: Image.asset(
                    product.image,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  product.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
                //  const SizedBox(height: 10),
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
          );
        });
  }
}
