import "package:flutter/material.dart";
import "package:intl/intl.dart";
import "package:opinions/features/home%20screen/models/post_model.dart";

class Post extends StatelessWidget {
  const Post({super.key, required this.post});

  final PostModel post;

  @override
  Widget build(BuildContext context) {

    DateTime now = post.createdAt;
    String formattedDate = DateFormat('HH:mm dd:MM:yyyy').format(now);


    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [Colors.grey, Colors.white, Colors.grey],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Text(post.title),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  post.genre,
                  style: TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w900),
                ),
                Text(formattedDate,  style: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w900),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Text(post.context, style: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 18
            ),)
          ],
        ),
      ),
    );
  }
}
