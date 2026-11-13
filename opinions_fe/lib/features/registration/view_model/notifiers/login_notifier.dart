import "package:flutter_secure_storage/flutter_secure_storage.dart";
import "package:opinions/features/registration/enums/login_status_enums.dart";
import "package:opinions/features/registration/repository/services/token_storge_service.dart";
import "package:opinions/features/registration/view_model/provider/auth_provider.dart";
import "package:opinions/features/registration/view_model/provider/token_storage_provider.dart";
import "package:opinions/features/registration/view_model/state/login_state.dart";
import "package:riverpod/riverpod.dart";

class LoginNotifier extends Notifier<LoginState> {
  @override
  LoginState build() {
    return LoginState(
      username: "",
      password: "",
      loginState: LoginStatusEnums.initial,
    );
  }

  // void enteredUsername(String username) {
  //   state = state.copyWith(username: username);
  // }
  //
  // void enteredPassword(String password) {
  //   state = state.copyWith(password: password);
  // }

  Future<void> userLogin(String username, String password) async {

    state = state.copyWith(loginState: LoginStatusEnums.loading);

    try {
      final repository = ref.read(authProvider);

      final token = await repository.login(username, password);

      // safe token storage

      final tokenStorage = TokenStorgeService();

      // save token
      tokenStorage.saveToken(token);

      state = state.copyWith(loginState: LoginStatusEnums.success);
    } catch (e) {
      if (e.toString().contains("Invalid credentials")) {
        state = state.copyWith(
            loginState: LoginStatusEnums.invalidCredentials);
      }
      if (e.toString().contains("User does not exist")){
        state = state.copyWith(
          loginState: LoginStatusEnums.doesNotExist
        );
      }
      else {
        state = state.copyWith(
            loginState: LoginStatusEnums.error);
      }
    }
  }

  void submitInput(){
    print("submitted");
  }

}
