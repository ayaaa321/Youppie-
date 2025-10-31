import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontwheight;
  final Widget? leading;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final double height;

  const CustomAppBar({
    required this.title, // Ab app bar must have a title
    this.leading,
    this.textColor,
    this.fontSize,
    this.fontwheight,
    this.actions,
    this.backgroundColor,
    this.height = kToolbarHeight,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              color: textColor ?? const Color(0xFF3B3B3A),
              fontWeight: fontwheight ?? FontWeight.w600,
              fontSize: fontSize ?? 20,
            ),
          ),
        ],
      ),
      leading: leading,
      actions: actions,
      backgroundColor: backgroundColor ?? Theme.of(context).colorScheme.primary,
      elevation: 10,
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight); // this is used to set the height of the AppBar
}
