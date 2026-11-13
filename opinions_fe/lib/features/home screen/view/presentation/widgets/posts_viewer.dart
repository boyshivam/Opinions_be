import "package:flutter/material.dart";
import "package:opinions/features/home%20screen/view/presentation/widgets/post.dart";

import "../../../models/post_model.dart";


class PostsViewer extends StatelessWidget {
  const PostsViewer({super.key, required this.posts, required this.parentHeight});

  final List<PostModel> posts;
  final double parentHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: parentHeight,
      child: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) => Post(post: posts[index])),
    );
  }
}
