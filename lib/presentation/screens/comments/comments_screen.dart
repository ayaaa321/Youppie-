import 'package:flutter/material.dart';
import 'package:youppie/presentation/themes/colors.dart';
import 'package:youppie/presentation/models/comment_model.dart';
import 'widgets/comment_card.dart';
import 'widgets/comment_input_field.dart';
import 'package:youppie/routes.dart';

class CommentsScreen extends StatefulWidget {
  const CommentsScreen({super.key});

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  bool isGuest = true;

  CommentModel? _replyTo;
  String? _replyToUsername;

  final ScrollController _scrollController = ScrollController();

  final List<CommentModel> _comments = [
    CommentModel(
      id: 'c1',
      userId: 'u1',
      userName: 'Nadia',
      avatar: 'assets/images/picture.jpeg',
      text: 'What a lovely dog! Where was this found?',
      timeAgo: '3h',
      likeCount: 5,
      likedByMe: false,
      replies: [
        CommentModel(
          id: 'r1',
          userId: 'u2',
          userName: 'Amir',
          avatar: 'assets/images/picture1.jpeg',
          text: 'Near the central park, saw it today.',
          timeAgo: '2h',
          likeCount: 1,
          likedByMe: false,
        ),
      ],
    ),

    CommentModel(
      id: 'c2',
      userId: 'u3',
      userName: 'Salma',
      avatar: 'assets/images/picture2.jpeg',
      text: 'Any info about vaccinations?',
      timeAgo: '1h',
      likeCount: 2,
      likedByMe: false,
      replies: [],
    ),

    CommentModel(
      id: 'c3',
      userId: 'u2',
      userName: 'Ghezlene',
      avatar: 'assets/images/picture.jpeg',
      text:
          'Cute! Win n9der nlgah sltp? This is a longer comment to test Read More functionality for guests. This is a longer comment to test Read More functionality for guests. It should be truncated.',
      timeAgo: '3h',
      likeCount: 5,
      likedByMe: false,
      replies: [
        CommentModel(
          id: 'r2',
          userId: 'u2',
          userName: 'Amir',
          avatar: 'assets/images/picture1.jpeg',
          text: 'Near the central park, saw it today.',
          timeAgo: '2h',
          likeCount: 1,
          likedByMe: false,
        ),
      ],
    ),
  ];

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // ---------------------------------------------------------------------------
  // LOGIN POPUP
  // ---------------------------------------------------------------------------
  void _showLoginDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/snoopy_login.png', height: 140),
            const SizedBox(height: 16),
            const Text(
              'Please log in to continue',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () {}, child: const Text("Login")),
                const SizedBox(width: 10),
                OutlinedButton(onPressed: () {}, child: const Text("Register")),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // LIKE / REPLY / ADD COMMENT
  // ---------------------------------------------------------------------------
  void _toggleLike({required String commentId, String? parentId}) {
    if (isGuest) {
      _showLoginDialog();
      return;
    }

    setState(() {
      if (parentId == null) {
        final c = _comments.firstWhere((c) => c.id == commentId);
        c.likedByMe = !c.likedByMe;
        c.likeCount += c.likedByMe ? 1 : -1;
      } else {
        final parent = _comments.firstWhere((p) => p.id == parentId);
        final r = parent.replies.firstWhere((r) => r.id == commentId);
        r.likedByMe = !r.likedByMe;
        r.likeCount += r.likedByMe ? 1 : -1;
      }
    });
  }

  void _startReply(CommentModel parent) {
    if (isGuest) {
      _showLoginDialog();
      return;
    }

    setState(() {
      _replyTo = parent;
      _replyToUsername = parent.userName;
    });
  }

  void _cancelReply() {
    setState(() {
      _replyTo = null;
      _replyToUsername = null;
    });
  }

  Future<void> _addComment(String text) async {
    if (isGuest) {
      _showLoginDialog();
      return;
    }

    if (text.trim().isEmpty) return;

    final newComment = CommentModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      userId: 'me',
      userName: 'You',
      avatar: 'assets/images/picture.jpeg',
      text: text.trim(),
      timeAgo: 'now',
      likeCount: 0,
      likedByMe: false,
    );

    setState(() {
      if (_replyTo == null) {
        _comments.add(newComment);
      } else {
        final parentIndex = _comments.indexWhere((c) => c.id == _replyTo!.id);
        if (parentIndex != -1) {
          _comments[parentIndex].replies =
              List.from(_comments[parentIndex].replies)..add(newComment);
        }
        _replyTo = null;
        _replyToUsername = null;
      }
    });
  }

  // ---------------------------------------------------------------------------
  // COMMENTS LIST
  // ---------------------------------------------------------------------------
  Widget _buildCommentsList() {
    final visible = isGuest ? _comments.take(10).toList() : _comments;

    final list = <Widget>[];

    for (final c in visible) {
      list.add(
        CommentCard(
          comment: c,
          isReply: false,
          isGuest: isGuest,
          onLike: () => _toggleLike(commentId: c.id),
          onReply: () => _startReply(c),
        ),
      );

      for (final r in c.replies) {
        list.add(
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: CommentCard(
              comment: r,
              isReply: true,
              parentId: c.id,
              isGuest: isGuest,
              onLike: () =>
                  _toggleLike(commentId: r.id, parentId: c.id),
              onReply: () => _startReply(c),
            ),
          ),
        );
      }
    }

    if (isGuest && _comments.length > 10) {
      list.add(
        Stack(
          children: [
            Column(
              children: _comments.skip(10).map((c) {
                return CommentCard(comment: c, isGuest: true);
              }).toList(),
            ),
            Container(
              color: Colors.white.withOpacity(0.7),
              padding: const EdgeInsets.all(20),
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('assets/images/snoopy_login.png', height: 200),
                  const SizedBox(height: 12),
                  const Text(
                    'Login to see more comments',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: _showLoginDialog,
                        child: const Text("Login"),
                      ),
                      const SizedBox(width: 10),
                      OutlinedButton(
                        onPressed: _showLoginDialog,
                        child: const Text("Register"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Column(children: list);
  }

  // ---------------------------------------------------------------------------
  // BUILD
  // ---------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.yellow,
      appBar: AppBar(
        backgroundColor: AppColors.yellow,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Comments',
          style: TextStyle(
            color: AppColors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      // ------------------- FIXED CLEAN BODY -------------------
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  padding: const EdgeInsets.only(bottom: 120),
                  child: _buildCommentsList(),
                ),
              ),

              // ---------------- COMMENT COMPOSER ----------------
              Container(
                color: AppColors.yellow,
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                child: CommentInputField(
                  replyingToUsername: _replyToUsername,
                  onCancelReply: _cancelReply,
                  onSend: (text) async {
                    await _addComment(text);
                  },
                ),
              ),
            ],
          ),


// ---------------- GUEST POPUP ----------------
if (isGuest)
  Positioned(
    bottom: 0,
    left: 0,
    right: 0,
    child: Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.yellow.withOpacity(0.75),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // ⚠️ Warning Icon
          Icon(
            Icons.warning_amber_rounded,
            color: AppColors.orange,
            size: 40,
          ),

          const SizedBox(width: 8),

          // Text
          const Text(
            "Sign in to comment",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 16,
            ),
          ),

          const SizedBox(width: 12),

          // Buttons row
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, signin);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.orange.withOpacity(0.74),
                  foregroundColor: Colors.black,
                ),
                child: const Text("Login"),
              ),

              const SizedBox(width: 8),

              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.black,
                  side: BorderSide(
                    color: AppColors.orange, // 🔥 Updated underline color
                    width: 1.4,
                  ),
                ),
                onPressed: () {
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

        ],
      ),
    );
  }
}
