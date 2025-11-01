import 'package:flutter/material.dart';
import 'package:youppie/presentation/screens/onboarding/onboarding_screen.dart';
import 'package:youppie/presentation/screens/posts/add_post_screen.dart';
import 'presentation/themes/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'presentation/screens/home/feed_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter App',
      theme: AppTheme.lightTheme,
      home: const AddPostScreen(),
    );
  }
}
