import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:opinions/features/create_module/enums/createPostTextFieldEnums.dart";
import "package:opinions/features/create_module/enums/post_creation_enums.dart";
import "package:opinions/features/create_module/models/create_post_model.dart";
import "package:opinions/features/create_module/view_model/state/post_state.dart";
import "package:opinions/features/create_module/repository/post_services.dart";

class CreatePostNotifier extends Notifier<PostState> {
  @override
  build() {
    // TODO: implement build
    return PostState(
      titleFieldText: "",
      genreFieldText: "",
      contextFieldText: "",
      titleFieldState: CreatePostTextFieldEnums.neutral,
      genreFieldState: CreatePostTextFieldEnums.neutral,
      contextFieldState: CreatePostTextFieldEnums.neutral,
      postStatus: PostCreationEnums.initial,
    );
  }


  Future<void> addPostData(String title, String genre, String context) async {
    final PostCreationEnums responseStatus = await createAPost(
      CreatePostModel(title: title, genre: genre, context: context),
    );

    switch (responseStatus) {
      case PostCreationEnums.loading:
        state = state.copyWith(postStatus: PostCreationEnums.loading);
        break;

      case PostCreationEnums.success:
        state = state.copyWith(postStatus: PostCreationEnums.success);
        break;

      case PostCreationEnums.internalServerError:
        state = state.copyWith(
            postStatus: PostCreationEnums.internalServerError
        );
        break;

      case PostCreationEnums.error:
        state = state.copyWith(postStatus: PostCreationEnums.error);
        break;

      default:
        break;
    }
  }
}
