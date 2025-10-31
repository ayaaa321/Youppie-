import 'package:flutter/material.dart';
import 'package:youppie/presentation/themes/colors.dart';

class PostCard extends StatelessWidget {
  final String username; // poster's name
  final String userProfilePic; // poster's profile picture path
  final String timeAgo; // e.g., '2 hours ago'
  final String postType; //Adoption, general
  final String content; // post text content
  final String? imagePath; // optional image
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
  Widget build(BuildContext context) {
    return Card(
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
                    userProfilePic,
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
                      username,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(timeAgo, style: TextStyle(color: AppColors.grey)),
                  ],
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: postTypeColor[postType] ?? AppColors.green,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    postType,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Post content
            Text(content, maxLines: 2, overflow: TextOverflow.ellipsis),
            if (content.length > 100) // or some other threshold
              GestureDetector(
                onTap: () {
                  // Expand the post text
                  // You might need a StatefulWidget for this
                },
                child: const Text(
                  "Read more",
                  style: TextStyle(
                    color: AppColors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

            // Optional image
            if (imagePath != null) ...[
              const SizedBox(height: 10),
              Image.asset(imagePath!),
            ],

            const SizedBox(height: 10),

            // Bottom row: likes, comments, contact
            Row(
              children: [
                Icon(Icons.favorite_outline, color: AppColors.green),
                const SizedBox(width: 5),
                Text(
                  likes.toString(), //converting the number of likes to string
                  style: TextStyle(color: AppColors.black),
                ),
                const SizedBox(width: 25),
                Icon(Icons.comment_outlined, color: AppColors.green),
                const SizedBox(width: 5),
                Text(
                  comments.toString(),
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
