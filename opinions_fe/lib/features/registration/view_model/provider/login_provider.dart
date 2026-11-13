import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:opinions/features/registration/view_model/notifiers/login_notifier.dart";
import "package:opinions/features/registration/view_model/state/login_state.dart";

final loginProvider = NotifierProvider<LoginNotifier, LoginState>(() {
  return LoginNotifier();
});