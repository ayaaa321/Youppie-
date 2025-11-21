import 'package:flutter/material.dart';
import 'package:youppie/presentation/themes/colors.dart';
import 'package:youppie/presentation/models/comment_model.dart';

class CommentCard extends StatefulWidget {
  final CommentModel comment;
  final bool isReply;
  final String? parentId; // id of parent comment if this is a reply
  final VoidCallback? onLike;
  final VoidCallback? onReply;

  const CommentCard({
    super.key,
    required this.comment,
    this.isReply = false,
    this.parentId,
    this.onLike,
    this.onReply,
  });

  @override
  State<CommentCard> createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animController;
  late final Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _scaleAnim = Tween<double>(begin: 1.0, end: 1.22).animate(
      CurvedAnimation(parent: _animController, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  void _doLike() {
    widget.onLike?.call();
    _animController.forward().then((_) => _animController.reverse());
    setState(() {});
  }

  ImageProvider? _avatarProvider(String? avatar) {
    if (avatar == null) return null;
    if (avatar.startsWith('http')) return NetworkImage(avatar);
    return AssetImage(avatar);
  }

  @override
  Widget build(BuildContext context) {
    final c = widget.comment;

    // card content (name/time/text/actions)
    final cardContent = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // header row
        Row(
          children: [
            Expanded(
              child: Text(
                c.userName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
            ),
            Text(
              c.timeAgo,
              style: const TextStyle(color: AppColors.lightGrey, fontSize: 12),
            ),
          ],
        ),
        const SizedBox(height: 8),

        // text with optional short green vertical line for replies
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.isReply)
              // short vertical green line beside the text
              Container(
                width: 4,
                height: 42, // short line
                margin: const EdgeInsets.only(right: 10, top: 4),
                decoration: BoxDecoration(
                  color: AppColors.green.withOpacity(0.85),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),

            Expanded(
              child: Text(
                c.text,
                style: const TextStyle(color: AppColors.grey, height: 1.4),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),

        // actions row
        Row(
          children: [
            GestureDetector(
              onTap: _doLike,
              child: Row(
                children: [
                  ScaleTransition(
                    scale: _scaleAnim,
                    child: Icon(
                      Icons.thumb_up,
                      size: 18,
                      color: c.likedByMe ? AppColors.green : AppColors.lightGrey,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text("${c.likeCount}",
                      style: const TextStyle(color: AppColors.lightGrey)),
                ],
              ),
            ),
            const SizedBox(width: 18),
            GestureDetector(
              onTap: widget.onReply,
              child: const Row(
                children: [
                  Icon(Icons.reply, size: 18, color: AppColors.lightGrey),
                  SizedBox(width: 6),
                  Text("Reply", style: TextStyle(color: AppColors.lightGrey)),
                ],
              ),
            ),
          ],
        ),
      ],
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // avatar
        GestureDetector(
          onTap: () {
            // teammate will implement profile screen later
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Profile screen not available yet")),
            );
          },
          child: CircleAvatar(
            radius: widget.isReply ? 16 : 20,
            backgroundImage: _avatarProvider(c.avatar),
            backgroundColor: AppColors.green.withOpacity(0.12),
            child: c.avatar == null
                ? Icon(Icons.person,
                    color: AppColors.green, size: widget.isReply ? 16 : 20)
                : null,
          ),
        ),

        const SizedBox(width: 12),

        // main card box
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(14),
            ),
            child: cardContent,
          ),
        ),
      ],
    );
  }
}
