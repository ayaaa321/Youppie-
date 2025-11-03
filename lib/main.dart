import 'package:flutter/material.dart';
import 'package:youppie/presentation/screens/comments/comments_screen.dart';
import 'package:youppie/presentation/screens/notifications/notifications_screen.dart';
import 'package:youppie/presentation/screens/onboarding/onboarding_screen.dart';
import 'package:youppie/presentation/screens/posts/add_post_screen.dart';
import 'presentation/themes/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'presentation/screens/home/feed_screen.dart';
import 'presentation/screens/auth/login_screen.dart';
import 'presentation/screens/auth/signup_screen.dart';
import 'presentation/screens/profile/profile_screen.dart';
import 'presentation/screens/settings/settings_screen.dart';
import 'presentation/screens/help_and_support/help_and_support.dart';
import 'presentation/screens/terms_of_service/terms_of_service.dart';
import 'presentation/screens/privacy_policy/privacy_policy.dart';

import 'package:youppie/presentation/screens/home/feed_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Youppie',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
      //home: const CreateAccountPage(), //  change to LoginScreen() if needed
      //home: const LoginScreen(),
      //
      //home: const ProfileScreen(),
      home: const SettingsScreen(),
      //home: const  HelpSupportApp(),
      // home: const TermsOfServiceApp(),
      // home: const PrivacyPolicyApp(),
    );
  }
}
