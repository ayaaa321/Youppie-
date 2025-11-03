class AppNotification {
  final String id;
  final String? profilePic;
  final String title;
  final String subtitle;
  final String time;
  final String type; // like, comment, reply, alert_lost, alert_found, alert_adoption, contact
  bool isUnread; // now mutable

  AppNotification({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.type,
    this.profilePic,
    this.isUnread = true,
  });
}
