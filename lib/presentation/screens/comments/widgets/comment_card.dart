import 'package:flutter/material.dart';
import 'package:youppie/presentation/themes/colors.dart';
import 'package:youppie/routes.dart';
import 'package:youppie/presentation/models/comment_model.dart';
import 'package:youppie/presentation/screens/profile/profile_screen.dart';

class CommentCard extends StatefulWidget {
  final CommentModel comment;
  final bool isReply;
  final String? parentId;
  final VoidCallback? onLike;
  final VoidCallback? onReply;
  final bool isGuest;

  const CommentCard({
    super.key,
    required this.comment,
    required this.isGuest,
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
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _scaleAnim = Tween<double>(
      begin: 1.0,
      end: 1.22,
    ).animate(CurvedAnimation(parent: _animController, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  void _toggleExpand() {
    if (widget.isGuest) {
      _showGuestPopup();
      return;
    }
    setState(() => _isExpanded = !_isExpanded);
  }

  void _doLike() {
    if (widget.isGuest) {
      _showGuestPopup();
      return;
    }
    widget.onLike?.call();
    _animController.forward().then((_) => _animController.reverse());
    setState(() {});
  }

  ImageProvider? _avatarProvider(String? avatar) {
    if (avatar == null) return null;
    if (avatar.startsWith('http')) return NetworkImage(avatar);
    return AssetImage(avatar);
  }

  // ---------- GUEST POPUP ----------
  void _showGuestPopup() {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        backgroundColor: AppColors.yellow,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/snoopy_login.png', height: 160),
              const SizedBox(height: 4),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(
                    Icons.warning_amber_rounded,
                    color: AppColors.orange,
                    size: 22,
                  ),
                  SizedBox(width: 6),
                  Text(
                    'Login to see the full comment',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ORANGE ElevatedButton
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.orange,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 8,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/signin');
                    },
                    child: const Text("Login"),
                  ),
                  const SizedBox(width: 8),
                  // ORANGE OutlinedButton
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.black,
                      side: const BorderSide(color: AppColors.orange),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 8,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, signup);
                    },
                    child: const Text("Register"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ---------- LOGIN POPUP ----------
  void _showLoginDialog() {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        backgroundColor: AppColors.yellow,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/snoopy_login.png', height: 160),
              const SizedBox(height: 4),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(
                    Icons.warning_amber_rounded,
                    color: AppColors.orange,
                    size: 22,
                  ),
                  SizedBox(width: 6),
                  Text(
                    'Please log in to continue',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ORANGE ElevatedButton
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.orange,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 8,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, signin);
                    },
                    child: const Text("Login"),
                  ),
                  const SizedBox(width: 8),
                  // ORANGE OutlinedButton
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.black,
                      side: const BorderSide(color: AppColors.orange),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 8,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, signup);
                    },
                    child: const Text("Register"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ----------- WIDGET BUILD -----------

  @override
  Widget build(BuildContext context) {
    final c = widget.comment;
    final displayedText = _isExpanded
        ? c.text
        : (c.text.length > 120 ? c.text.substring(0, 120) + '...' : c.text);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
            );
          },
          child: CircleAvatar(
            radius: widget.isReply ? 16 : 20,
            backgroundImage: _avatarProvider(c.avatar),
            backgroundColor: AppColors.green.withOpacity(0.12),
            child: c.avatar == null
                ? Icon(
                    Icons.person,
                    color: AppColors.green,
                    size: widget.isReply ? 16 : 20,
                  )
                : null,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Username + time
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
                      style: const TextStyle(
                        color: AppColors.lightGrey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (widget.isReply)
                      Container(
                        width: 4,
                        height: 42,
                        margin: const EdgeInsets.only(right: 10, top: 4),
                        decoration: BoxDecoration(
                          color: AppColors.green.withOpacity(0.85),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: _toggleExpand,
                            child: Text(
                              displayedText,
                              style: TextStyle(
                                color: AppColors.black,
                                height: 1.4,
                              ),
                            ),
                          ),
                          if (c.text.length > 120)
                            GestureDetector(
                              onTap: _toggleExpand,
                              child: Text(
                                _isExpanded ? 'Show less' : 'Read more',
                                style: const TextStyle(
                                  color: AppColors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                // Likes + Reply
                Row(
                  children: [
                    GestureDetector(
                      onTap: widget.isGuest ? _showLoginDialog : _doLike,
                      child: Row(
                        children: [
                          ScaleTransition(
                            scale: _scaleAnim,
                            child: Icon(
                              Icons.thumb_up,
                              size: 18,
                              color: c.likedByMe
                                  ? AppColors.green
                                  : AppColors.lightGrey,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            '${c.likeCount}',
                            style: const TextStyle(color: AppColors.lightGrey),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 18),
                    GestureDetector(
                      onTap: widget.isGuest ? _showLoginDialog : widget.onReply,
                      child: Row(
                        children: const [
                          Icon(
                            Icons.reply,
                            size: 18,
                            color: AppColors.lightGrey,
                          ),
                          SizedBox(width: 6),
                          Text(
                            "Reply",
                            style: TextStyle(color: AppColors.lightGrey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
