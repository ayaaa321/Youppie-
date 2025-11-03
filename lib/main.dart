import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:youppie/presentation/screens/comments/comments_screen.dart';
import 'package:youppie/presentation/screens/notifications/notifications_screen.dart';
import 'package:youppie/presentation/screens/onboarding/onboarding_screen.dart';
import 'package:youppie/presentation/screens/posts/add_post_screen.dart';
import 'presentation/themes/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'presentation/screens/home/feed_screen.dart';
=======
import 'package:youppie/presentation/screens/home/feed_screen.dart';
>>>>>>> 1f91e4aebc0556b011f2b3509e63516da513d131

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
<<<<<<< HEAD
      title: 'My Flutter App',
      theme: AppTheme.lightTheme,
      home:  CommentsScreen(),
=======
      title: 'Youppie',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: FeedScreen(),
>>>>>>> 1f91e4aebc0556b011f2b3509e63516da513d131
    );
  }
}
