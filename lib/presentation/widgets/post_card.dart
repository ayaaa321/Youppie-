import 'package:flutter/material.dart';
import 'package:youppie/presentation/themes/colors.dart';

class PostCard extends StatefulWidget {
  final String username;
  final String userProfilePic;
  final String timeAgo;
  final String postType;
  final String content;
  final List? imagePath;
  final int likes;
  final int comments;

  const PostCard({
    super.key,
    required this.username,
    required this.userProfilePic,
    required this.timeAgo,
    required this.postType,
    required this.content,
    this.imagePath,
    this.likes = 0,
    this.comments = 0,
  });

  static var postTypeColor = {
    'Adoption': AppColors.green,
    'General': AppColors.darkGreen,
  };

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  late int likeCount;
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
    likeCount = widget.likes;
  }

  void toggleLike() {
    setState(() {
      if (isLiked) {
        likeCount--;
      } else {
        likeCount++;
      }
      isLiked = !isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.lightYellow,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top row: profile + post type
            Row(
              children: [
                // Profile picture
                ClipOval(
                  child: Image.asset(
                    widget.userProfilePic,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover, // make sure it fills the circle
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.username,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.timeAgo,
                      style: TextStyle(color: AppColors.grey),
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color:
                        PostCard.postTypeColor[widget.postType] ??
                        AppColors.green,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    widget.postType,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Post content
            Text(widget.content, maxLines: 2, overflow: TextOverflow.ellipsis),
            if (widget.content.length > 100) // or some other threshold
              GestureDetector(
                onTap: () {},
                child: const Text(
                  "Read more",
                  style: TextStyle(
                    color: AppColors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

            // Optional image
            if (widget.imagePath != null) ...[
              const SizedBox(height: 10),
              if (widget.imagePath!.length == 1)
                Image.asset(
                  widget.imagePath![0],
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              if (widget.imagePath!.length > 1)
                SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: PageView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.imagePath!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Image.asset(widget.imagePath![index]),
                      );
                    },
                  ),
                ),
            ],

            const SizedBox(height: 10),

            // Bottom row: likes, comments, contact
            Row(
              children: [
                IconButton(
                  onPressed: toggleLike,
                  icon: Icon(
                    isLiked ? Icons.favorite : Icons.favorite_outline,
                    color: isLiked ? AppColors.darkGreen : AppColors.green,
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  likeCount.toString(),
                  style: TextStyle(color: AppColors.black),
                ),
                const SizedBox(width: 25),
                Icon(Icons.comment_outlined, color: AppColors.green),
                const SizedBox(width: 5),
                Text(
                  widget.comments.toString(),
                  style: TextStyle(color: AppColors.black),
                ),
                const SizedBox(width: 25),
                Icon(Icons.share_outlined, color: AppColors.green),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text(
                    "Contact",
                    style: TextStyle(color: Colors.white),
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
