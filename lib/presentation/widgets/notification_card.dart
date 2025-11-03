import 'package:flutter/material.dart';
import 'package:youppie/presentation/models/notification_model.dart';
import 'package:youppie/presentation/themes/colors.dart';

class NotificationCard extends StatelessWidget {
  final AppNotification notification;
  final VoidCallback? onTap;

  const NotificationCard({
    super.key,
    required this.notification,
    this.onTap,
  });

  IconData _getIcon() {
    switch (notification.type) {
      case "like":
        return Icons.favorite;
      case "comment":
        return Icons.mode_comment;
      case "reply":
        return Icons.reply;
      case "alert_lost":
        return Icons.pets;
      case "alert_found":
        return Icons.search;
      case "alert_adoption":
        return Icons.volunteer_activism;
      case "contact":
        return Icons.phone;
      default:
        return Icons.notifications;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.05),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            // Profile image or placeholder icon
            CircleAvatar(
              radius: 24,
              backgroundColor: AppColors.green.withOpacity(0.12),
              backgroundImage:
                  notification.profilePic != null ? AssetImage(notification.profilePic!) as ImageProvider : null,
              child: notification.profilePic == null
                  ? Icon(_getIcon(), color: AppColors.green)
                  : null,
            ),
            const SizedBox(width: 12),

            // Text content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: notification.title,
                          style: TextStyle(
                            color: AppColors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: " ${notification.subtitle}",
                          style: const TextStyle(
                            color: AppColors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    notification.time,
                    style: const TextStyle(
                      color: AppColors.lightGrey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),

            // Unread dot (only if unread)
            if (notification.isUnread)
              Container(
                margin: const EdgeInsets.only(left: 8),
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  color: AppColors.green,
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
