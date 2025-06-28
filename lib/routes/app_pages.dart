import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:ideasnconcepts/modules/profile/bindings/profile_binding.dart';
import 'package:ideasnconcepts/modules/profile/views/edit_profile_view.dart';
import 'package:ideasnconcepts/modules/profile/views/orders_view.dart';
import 'package:ideasnconcepts/modules/profile/views/profile_view.dart';
import 'package:ideasnconcepts/routes/app_routes.dart';

class AppPages {
  AppPages._();

  static const String initial = AppRoutes.profile;

  static final List<GetPage> routes = [
    GetPage(
      name: AppRoutes.profile,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),

    GetPage(
      name: AppRoutes.editProfile,
      page: () => const EditProfileView(),
      binding: ProfileBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),

    GetPage(
      name: AppRoutes.orders,
      page: () => const OrdersView(),
      binding: ProfileBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
  ];
}
