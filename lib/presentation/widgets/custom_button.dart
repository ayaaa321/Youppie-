import 'package:flutter/material.dart';
import 'package:youppie/presentation/themes/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isOutlined; // for Register style
  final bool isSmall; // for smaller buttons inside popups
  final double? width;
  final Color? backgroundColor; // Button background color
  final Color? textColor; // Button text color
  final Color? borderColor; // Border color for outlined buttons

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isOutlined = false,
    this.isSmall = false,
    this.width,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    // Set default colors
    final bgColor = backgroundColor ?? AppColors.green;
    final txtColor = textColor ?? (isOutlined ? AppColors.green : AppColors.white);
    final bdrColor = borderColor ?? AppColors.green;

    final button = isOutlined
        ? OutlinedButton(
            onPressed: onPressed,
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: bdrColor, width: isSmall ? 1.5 : 2),
              padding: EdgeInsets.symmetric(
                  vertical: isSmall ? 10 : 14, horizontal: isSmall ? 12 : 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              text,
              style: TextStyle(
                fontSize: isSmall ? 14 : 16,
                fontWeight: FontWeight.bold,
                color: txtColor,
              ),
            ),
          )
        : ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: bgColor,
              padding: EdgeInsets.symmetric(
                  vertical: isSmall ? 10 : 14, horizontal: isSmall ? 12 : 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              text,
              style: TextStyle(
                fontSize: isSmall ? 14 : 16,
                fontWeight: FontWeight.bold,
                color: txtColor,
              ),
            ),
          );

    if (width != null) {
      return SizedBox(width: width, child: button);
    }

    return SizedBox(width: double.infinity, child: button);
  }
}