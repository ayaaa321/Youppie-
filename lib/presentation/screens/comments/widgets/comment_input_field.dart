import 'package:flutter/material.dart';
import 'package:youppie/presentation/themes/colors.dart';

class CommentInputField extends StatefulWidget {
  final String? replyingToUsername; // null if top-level
  final VoidCallback? onCancelReply;
  final Future<void> Function(String) onSend; // returns future to allow UI actions

  const CommentInputField({
    super.key,
    required this.onSend,
    this.replyingToUsername,
    this.onCancelReply,
  });

  @override
  State<CommentInputField> createState() => _CommentInputFieldState();
}

class _CommentInputFieldState extends State<CommentInputField> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focus = FocusNode();
  bool _sending = false;

  @override
  void didUpdateWidget(covariant CommentInputField oldWidget) {
    super.didUpdateWidget(oldWidget);
    // if entering reply mode, request focus
    if (widget.replyingToUsername != null &&
        oldWidget.replyingToUsername != widget.replyingToUsername) {
      Future.delayed(const Duration(milliseconds: 120), () {
        if (mounted) FocusScope.of(context).requestFocus(_focus);
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _focus.dispose();
    super.dispose();
  }

  Future<void> _handleSend() async {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    setState(() => _sending = true);
    await widget.onSend(text);
    if (mounted) {
      _controller.clear();
      setState(() => _sending = false);
      FocusScope.of(context).unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isReplying = widget.replyingToUsername != null;
    return SafeArea(
      top: false,
      child: Container(
        color: AppColors.yellow,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isReplying)
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Replying to @${widget.replyingToUsername}",
                      style: const TextStyle(color: AppColors.darkGreen),
                    ),
                  ),
                  TextButton(
                    onPressed: widget.onCancelReply,
                    child: const Text("Cancel", style: TextStyle(color: AppColors.lightGrey)),
                  ),
                ],
              ),
            Row(
              children: [
                CircleAvatar(
                  radius: 18,
                  backgroundImage: const AssetImage("assets/images/picture.jpeg"),
                  backgroundColor: AppColors.green.withOpacity(0.12),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Container(
                    height: 46,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            focusNode: _focus,
                            controller: _controller,
                            decoration: const InputDecoration(
                              hintText: "Add a comment...",
                              border: InputBorder.none,
                              hintStyle: TextStyle(color: AppColors.lightGrey),
                            ),
                            textInputAction: TextInputAction.send,
                            onSubmitted: (_) => _handleSend(),
                          ),
                        ),
                        GestureDetector(
                          onTap: _sending ? null : _handleSend,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: AppColors.green,
                              shape: BoxShape.circle,
                            ),
                            child: _sending
                                ? const SizedBox(
                                    width: 16,
                                    height: 16,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: AppColors.white,
                                    ),
                                  )
                                : const Icon(Icons.send, color: AppColors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
