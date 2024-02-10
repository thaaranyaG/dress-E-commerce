import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_project_4/controllers/details_controller.dart';
import 'package:task_project_4/screens/cart_screen.dart';
import 'package:task_project_4/screens/product%20_list.dart';
import 'package:task_project_4/widgets/circle_tab.dart';
import 'package:task_project_4/widgets/tabs.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.products});

  final Products products;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

bool s = true;
bool m = false;
bool l = false;
bool xl = false;

bool b = false;
bool y = true;
bool r = false;
String imagePath = 'assets/images/img_2.png';

class _DetailsScreenState extends State<DetailsScreen> {
  DetailsController detailsController = Get.put(DetailsController());
  late List<Products> cart;

  @override
  void initState() {
    super.initState();
    imagePath = widget.products.image; // Initialize imagePath with the default image
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_outlined),
        ),
        title: const Text(
          'Details',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Get.to(() => const CartScreen());
            },
            child: Image.asset(
              'assets/icons/shopping.png',
              color: Colors.black87,
              height: 20,
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 400,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.orange.shade50,
              ),
              child: Image.asset(
                imagePath,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Women\'s\nSweatshirt',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                Row(
                  children: [
                    CircleTabs(
                      isActive: b,
                      onTap: () {
                        setState(() {
                          b = true;
                          y = false;
                          r = false;
                          imagePath = 'assets/images/img_2.png';
                        });
                      },
                      color: Colors.lightBlueAccent.shade400,
                    ),
                    const SizedBox(width: 10),
                    CircleTabs(
                      isActive: y,
                      onTap: () {
                        setState(() {
                          b = false;
                          y = true;
                          r = false;
                          imagePath = widget.products.image;
                        });
                      },
                      color: Colors.yellow.shade400,
                    ),
                    const SizedBox(width: 10),
                    CircleTabs(
                      isActive: r,
                      onTap: () {
                        setState(() {
                          b = false;
                          y = false;
                          r = true;
                          imagePath = 'assets/images/img_4.png';
                        });
                      },
                      color: Colors.red.shade400,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Image.asset(
                  'assets/images/img_6.png',
                  height: 20,
                  width: 20,
                  color: Colors.yellow,
                ),
                const SizedBox(width: 10),
                const Text(
                  '4.8',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                const SizedBox(width: 10),
                const Text(
                  '80 reviews',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Tabs(
                    title: "X",
                    isActive: s,
                    onTap: () {
                      setState(() {
                        s = true;
                        m = false;
                        l = false;
                        xl = false;
                      });
                    },
                  ),
                  Tabs(
                    title: "M",
                    isActive: m,
                    onTap: () {
                      setState(() {
                        s = false;
                        m = true;
                        l = false;
                        xl = false;
                      });
                    },
                  ),
                  Tabs(
                    title: "L",
                    isActive: l,
                    onTap: () {
                      setState(() {
                        s = false;
                        m = false;
                        l = true;
                        xl = false;
                      });
                    },
                  ),
                  Tabs(
                    title: "XL",
                    isActive: xl,
                    onTap: () {
                      setState(() {
                        s = false;
                        m = false;
                        l = false;
                        xl = true;
                      });
                    },
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  '\u{20AC}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.black,
                  ),
                ),
                const Text(
                  '18,00',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.black,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => const CartScreen());
                    detailsController.addProduct(widget.products);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.black,
                    ),
                    child: Center(
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/icons/shopping.png",
                            color: Colors.white,
                            height: 20,
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            "Add to Bag",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
