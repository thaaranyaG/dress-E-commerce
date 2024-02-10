import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_project_4/screens/all.dart';
import 'package:task_project_4/screens/cart_screen.dart';
import 'package:task_project_4/screens/kid.dart';
import 'package:task_project_4/screens/men.dart';
import 'package:task_project_4/screens/search_screen.dart';
import 'package:task_project_4/screens/women.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

bool all = true;
bool mens = false;
bool womens = false;
bool kids = false;

class _DashboardScreenState extends State<DashboardScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.grey.shade300,
              ),
              child: const Icon(
                Icons.person,
                color: Colors.blue,
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              "Hi, Arif",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
          ],
        ),
        actions: [
          InkWell(
            onTap: () {
              Get.to(() => const SearchScreen());
            },
            child: Image.asset(
              "assets/icons/search.png",
              color: Colors.black,
              //   height: 20,
            ),
          ),
          const SizedBox(width: 20),
          InkWell(
            onTap: () {
              Get.to(() => const CartScreen());
            },
            child: Image.asset(
              "assets/icons/shopping.png",
              color: Colors.black87,
              height: 20,
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Stack(
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        const Text(
                          "Explore the",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.black,
                          ),
                          child: const Center(
                            child: Text(
                              "best",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: 50,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.black,
                          ),
                          child: const Center(
                            child: Text(
                              "Collections",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.lightGreen,
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const Text(
                              "for you ",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            Image.asset(
                              'assets/icons/smiley.png',
                              color: Colors.black,
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Positioned(
                  left: MediaQuery.of(context).size.height / 10,
                  top: 33,
                  child: Container(
                    height: 15,
                    width: 30,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Text(
              "Categories",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),

            ///
            /* SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Tabs(
                    title: "All",
                    isActive: all,
                    onTap: () {
                      setState(() {
                        all = true;
                        mens = false;
                        womens = false;
                        kids = false;
                      });
                    },
                  ),
                  Tabs(
                    title: "Men\'s",
                    isActive: mens,
                    onTap: () {
                      setState(() {
                        all = false;
                        mens = true;
                        womens = false;
                        kids = false;
                      });
                    },
                  ),
                  Tabs(
                    title: "Women\'s",
                    isActive: womens,
                    onTap: () {
                      setState(() {
                        all = false;
                        mens = false;
                        womens = true;
                        kids = false;
                      });
                    },
                  ),
                  Tabs(
                    title: "Kids",
                    isActive: kids,
                    onTap: () {
                      setState(() {
                        all = false;
                        mens = false;
                        womens = false;
                        kids = true;
                      });
                    },
                  ),
                ],
              ),
            ),*/
            const SizedBox(height: 10),
            TabBar(
              controller: _tabController,
              labelColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.tab,
              unselectedLabelColor: Colors.grey,
              indicator: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(30),
              ),
              tabs: const [
                Tab(
                  text: "All",
                ),
                Tab(
                  text: "Men\'s",
                ),
                Tab(
                  text: "Women\'s",
                ),
                Tab(
                  text: "Kids",
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  SingleChildScrollView(child: AllProducts()),
                  MenProducts(),
                  WomenProducts(),
                  KidsProducts(),
                ],
              ),
            ),

            /*  /// row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (all || womens)
                  InkWell(
                    onTap: () {
                      Get.to(() => const DetailsScreen());
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 200,
                          width: 165,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.orange.shade50,
                          ),
                          child: Image.asset(
                            'assets/images/img_2.png',
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Women\'s Sweatshirt',
                          style: TextStyle(
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
                  ),
                if (all || womens)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 200,
                        width: 165,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.grey.shade300,
                        ),
                        child: Image.asset(
                          'assets/images/img_11.png',
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Premium Cotton Shirt',
                        style: TextStyle(
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
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (all || mens)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 200,
                        width: 165,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.grey.shade300,
                        ),
                        child: Image.asset(
                          'assets/images/img_3.png',
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Men\'s T-Shirt',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Colors.black87,
                        ),
                      ),
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
                if (all || mens)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 200,
                        width: 165,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.blue.shade50,
                        ),
                        child: Image.asset(
                          'assets/images/img_1.png',
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Men\'s Hoddie',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Colors.black87,
                        ),
                      ),
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
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (all || kids)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 200,
                        width: 165,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.grey.shade300,
                        ),
                        child: Image.asset(
                          'assets/images/img_9.png',
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        ' Kids Frock',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Colors.black87,
                        ),
                      ),
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
                if (all || kids)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 200,
                        width: 165,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.blue.shade50,
                        ),
                        child: Image.asset(
                          'assets/images/img_10.png',
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Kids T-Shirt',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Colors.black87,
                        ),
                      ),
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
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (all || mens)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 200,
                        width: 165,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.grey.shade300,
                        ),
                        child: Image.asset(
                          'assets/images/img_3.png',
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        ' Kids Frock',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Colors.black87,
                        ),
                      ),
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
                if (all || mens)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 200,
                        width: 165,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.blue.shade50,
                        ),
                        child: Image.asset(
                          'assets/images/img_4.png',
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Kids T-Shirt',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Colors.black87,
                        ),
                      ),
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
              ],
            ),*/
          ],
        ),
      ),
    );
  }
}
