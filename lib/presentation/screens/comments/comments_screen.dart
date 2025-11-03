import 'package:flutter/material.dart';
import 'package:youppie/presentation/themes/colors.dart';
import 'package:youppie/presentation/models/comment_model.dart';
import 'widgets/comment_card.dart';
import 'widgets/comment_input_field.dart';

class CommentsScreen extends StatefulWidget {
  const CommentsScreen({super.key});

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  // sample data - uses same users as notifications for consistency
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
  ];

  // reply target state
  CommentModel? _replyTo; // parent comment
  String? _replyToUsername;

  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // toggle like for top-level comment or reply
  void _toggleLike({required String commentId, String? parentId}) {
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

  // start replying to a parent comment
  void _startReply(CommentModel parent) {
    setState(() {
      _replyTo = parent;
      _replyToUsername = parent.userName;
    });
    Future.delayed(const Duration(milliseconds: 120), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent + 150,
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _cancelReply() {
    setState(() {
      _replyTo = null;
      _replyToUsername = null;
    });
  }

  // add a comment or add a reply to a parent
  Future<void> _addComment(String text) async {
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
          _comments[parentIndex].replies = List.from(_comments[parentIndex].replies)
            ..add(newComment);
        } else {
          // fallback
          _comments.add(newComment);
        }
        // reset reply state after adding
        _replyTo = null;
        _replyToUsername = null;
      }
    });

    // scroll to bottom to show the new comment
    Future.delayed(const Duration(milliseconds: 120), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent + 180,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  Widget _buildCommentsList() {
    final List<Widget> widgets = [];
    for (final c in _comments) {
      widgets.add(CommentCard(
        comment: c,
        isReply: false,
        onLike: () => _toggleLike(commentId: c.id),
        onReply: () => _startReply(c),
      ));

      // render only first-level replies indented under parent
      if (c.replies.isNotEmpty) {
        for (final r in c.replies) {
          widgets.add(
            Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: CommentCard(
                comment: r,
                isReply: true,
                parentId: c.id,
                onLike: () => _toggleLike(commentId: r.id, parentId: c.id),
                onReply: () => _startReply(c),
              ),
            ),
          );
        }
      }
    }
    return Column(children: widgets);
  }

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
          style: TextStyle(color: AppColors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: _buildCommentsList(),
            ),
          ),

          // bottom fixed input (shows replying state when applicable)
          CommentInputField(
            replyingToUsername: _replyToUsername,
            onCancelReply: _cancelReply,
            onSend: (text) => _addComment(text),
          ),
        ],
      ),
    );
  }
}
