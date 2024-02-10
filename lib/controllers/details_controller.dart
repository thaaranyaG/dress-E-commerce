import 'package:get/get.dart';
import 'package:task_project_4/screens/product%20_list.dart';

class DetailsController extends GetxController {
  final List<Products> productList = [];

  void addProduct(Products product) {
    productList.add(product);
  }
}
