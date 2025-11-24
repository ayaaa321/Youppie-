import 'package:flutter/material.dart';
import 'package:youppie/presentation/themes/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isHome;
  final bool showBack;
  final bool showNotification;
  final VoidCallback? onBack;
  final VoidCallback? onNotification;
  final Color? backgroundColor;

  const CustomAppBar({
    required this.title,
    this.isHome = false,
    this.showBack = false,
    this.showNotification = true,
    this.onBack,
    this.onNotification,
    this.backgroundColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.green,
      elevation: 10,
      centerTitle: true,

      leading: showBack
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: onBack ?? () => Navigator.pop(context),
            )
          : (isHome
                ? Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Image(
                      image: AssetImage('assets/images/app_logo.png'),
                      height: 30,
                      width: 30,
                    ),
                  )
                : null),

      title: Text(
        title,
        style: const TextStyle(
          color: AppColors.lightYellow,
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
      ),

      actions: showNotification
          ? [
              IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () => {
                  Navigator.pushNamed(context, '/notifications'),
                },
              ),
            ]
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
