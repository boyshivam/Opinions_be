import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:opinions/features/create_module/view_model/notifiers/create_post_notifier.dart';
import 'package:opinions/features/create_module/view_model/state/post_state.dart';

final createPostProvider = NotifierProvider<CreatePostNotifier, PostState>((){
  return CreatePostNotifier();
});