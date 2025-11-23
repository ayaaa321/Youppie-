import 'package:flutter/material.dart';
import 'package:youppie/presentation/themes/colors.dart';
import 'package:youppie/presentation/widgets/notification_card.dart';
import 'package:youppie/presentation/models/notification_model.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  // mock data; you can later populate from provider / API
  final List<AppNotification> today = [
    AppNotification(
      id: "1",
      profilePic: "assets/images/picture.jpeg",
      title: "Nadia Zeinab",
      subtitle: "liked your post about Lulu.",
      time: "5m ago",
      type: "like",
      isUnread: true,
    ),
    AppNotification(
      id: "2",
      title: "New lost pet alert:",
      subtitle: "A German Shepherd was reported near you.",
      time: "15m ago",
      type: "alert_lost",
      isUnread: true,
    ),
  ];

  final List<AppNotification> yesterday = [
    AppNotification(
      id: "3",
      profilePic: "assets/images/picture1.jpeg",
      title: "Amirouche Hamza",
      subtitle: "commented on your adoption post.",
      time: "1h ago",
      type: "comment",
      isUnread: false,
    ),
  ];

  final List<AppNotification> earlier = [
    AppNotification(
      id: "4",
      title: "Found pet alert:",
      subtitle: "Someone reported a cat near your area.",
      time: "3d ago",
      type: "alert_found",
      isUnread: false,
    ),
    AppNotification(
      id: "5",
      profilePic: "assets/images/picture2.jpeg",
      title: "Yasmine B.",
      subtitle: "liked your comment.",
      time: "5d ago",
      type: "like",
      isUnread: false,
    ),
  ];

  void _handleTap(AppNotification n) {
    // mark read on tap
    setState(() {
      n.isUnread = false;
    });

    // for now show snackbar; later navigate to post/comment
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Opening item — navigation to post coming later")),
    );
  }

  Widget _buildSection(String title, List<AppNotification> list) {
    if (list.isEmpty) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
        ),
        const SizedBox(height: 8),
        ...list.map(
          (n) => NotificationCard(notification: n, onTap: () => _handleTap(n)),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.yellow,
      appBar: AppBar(
        backgroundColor: AppColors.yellow,
        elevation: 0,
        title: const Text(
          "Notifications",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.done_all, color: AppColors.darkGreen),
            onPressed: () {
              // mark all as read
              setState(() {
                for (var n in today) {
                  n.isUnread = false;
                }
                for (var n in yesterday) {
                  n.isUnread = false;
                }
                for (var n in earlier) {
                  n.isUnread = false;
                }
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection("Today", today),
            _buildSection("Yesterday", yesterday),
            _buildSection("Earlier", earlier),
            const SizedBox(height: 80), // give space for bottom nav
          ],
        ),
      ),
    );
  }
}
