import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ideasnconcepts/firebase_options.dart';
import 'package:ideasnconcepts/modules/profile/views/profile_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProfileTask());
}

class ProfileTask extends StatelessWidget {
  const ProfileTask({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: ProfileView());
  }
}
