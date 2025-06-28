import 'package:flutter/material.dart';
import 'package:ideasnconcepts/core/constants/strings.dart';
import 'package:ideasnconcepts/core/widgets/list_tile_button.dart';

class ListTileItem {
  final String title;
  final IconData icon;

  const ListTileItem({required this.title, required this.icon});
}

class ProfileMenuOptions extends StatelessWidget {
  const ProfileMenuOptions({super.key});

  static const List<ListTileItem> _menuItems = [
    ListTileItem(title: kPrivacyPolicy, icon: Icons.privacy_tip_outlined),
    ListTileItem(title: kPaymentMethods, icon: Icons.payment_outlined),
    ListTileItem(title: kNotification, icon: Icons.notifications_outlined),
    ListTileItem(title: kSettings, icon: Icons.settings_outlined),
    ListTileItem(title: kHelp, icon: Icons.help_outline),
    ListTileItem(title: kLogout, icon: Icons.logout_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _menuItems.length,
      itemBuilder: (context, index) {
        final item = _menuItems[index];
        return ListTileButton(title: item.title, icon: item.icon);
      },
    );
  }
}
