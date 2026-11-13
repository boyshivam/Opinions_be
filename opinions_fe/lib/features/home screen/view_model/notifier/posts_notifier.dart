import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:opinions/features/home%20screen/models/post_model.dart";

class PostsNotifier extends Notifier<List<PostModel>> {

  @override
  List<PostModel> build() {
    // TODO: implement build
    return [];
  }


  void createNewPost(PostModel post){
    state = [...state, post];
  }


}