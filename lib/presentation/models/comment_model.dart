class CommentModel {
  final String id;
  final String userId;
  final String userName;
  final String? avatar; // asset path OR network url (nullable)
  final String text;
  final String timeAgo; // e.g. "3h"

  int likeCount;
  bool likedByMe;
  List<CommentModel> replies;

  CommentModel({
    required this.id,
    required this.userId,
    required this.userName,
    this.avatar,
    required this.text,
    required this.timeAgo,
    this.likeCount = 0,
    this.likedByMe = false,
    this.replies = const [],
  });
}
