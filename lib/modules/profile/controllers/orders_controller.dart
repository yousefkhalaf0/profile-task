import 'dart:developer';
import 'package:get/get.dart';

class MyOrdersController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    loadOrders();
  }

  void loadOrders() {
    log('Loading orders...');
  }

  void goBack() {
    Get.back();
  }
}
