import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:opinions/features/home%20screen/view_model/notifier/posts_notifier.dart";

import "../../models/post_model.dart";

final postsProvider = NotifierProvider<PostsNotifier, List<PostModel>>((){
  return PostsNotifier();
});