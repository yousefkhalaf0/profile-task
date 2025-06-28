import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:ideasnconcepts/core/constants/strings.dart';
import 'package:ideasnconcepts/core/widgets/custom_app_bar.dart';
import 'package:ideasnconcepts/modules/profile/controllers/orders_controller.dart';

class OrdersView extends GetView<MyOrdersController> {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context,
        title: kMyOrders,
        onBackPressed: controller.goBack,
      ),
    );
  }
}
