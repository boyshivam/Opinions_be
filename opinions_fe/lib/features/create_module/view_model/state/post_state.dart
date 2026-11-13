

import 'package:opinions/features/create_module/enums/createPostTextFieldEnums.dart';
import 'package:opinions/features/create_module/enums/post_creation_enums.dart';

class PostState {
  const PostState({
   required this.titleFieldText,
    required this.genreFieldText,
    required this.contextFieldText,
    required this.titleFieldState,
    required this.genreFieldState,
    required this.contextFieldState,
    required this.postStatus
});


  final String titleFieldText;
  final CreatePostTextFieldEnums titleFieldState;
  final String genreFieldText;
  final CreatePostTextFieldEnums genreFieldState;
  final String contextFieldText;
  final CreatePostTextFieldEnums contextFieldState;
  final PostCreationEnums postStatus;


  PostState copyWith({

    String? titleFieldText,
    String? genreFieldText,
    String? contextFieldText,
    CreatePostTextFieldEnums? titleFieldState,
    CreatePostTextFieldEnums? genreFieldState,
    CreatePostTextFieldEnums? contextFieldState,
    PostCreationEnums? postStatus

}){
    return PostState(
        titleFieldText: titleFieldText ?? this.titleFieldText,
        genreFieldText: genreFieldText ?? this.genreFieldText,
        contextFieldText: contextFieldText ?? this.contextFieldText,
        titleFieldState: titleFieldState ?? this.titleFieldState,
        genreFieldState: genreFieldState ?? this.genreFieldState,
        contextFieldState: contextFieldState ?? this.contextFieldState,
        postStatus: postStatus ?? this.postStatus);
  }
}