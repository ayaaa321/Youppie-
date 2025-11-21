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
import 'package:youppie/presentation/screens/home/adoption_screen.dart';
import 'package:youppie/presentation/screens/home/vets_screen.dart';

const String onboarding = '/onboarding';
const String signup = '/signup';
const String signin = '/signin';
const String home = '/home';
const String notifications = '/notifications';
const String profile = '/profile';
const String vets = '/vets';
const String addPost = '/add_post';
const String comments = '/comments';
const String settings = '/settings';

Map<String, WidgetBuilder> routes = {
  onboarding: (context) => const OnboardingScreen(),
  signup: (context) => const CreateAccountPage(),
  signin: (context) => const LoginScreen(),
  home: (context) => const FeedScreen(),
  notifications: (context) => const NotificationsScreen(),
  profile: (context) => const ProfileScreen(),
  vets: (context) => const VetScreen(),
  addPost: (context) => const AddPostScreen(),
  comments: (context) => const CommentsScreen(),
  settings: (context) => const SettingsScreen(),
};
