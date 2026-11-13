import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:go_router/go_router.dart";
import "package:opinions/features/registration/enums/login_status_enums.dart";
import "package:opinions/features/registration/view_model/provider/login_provider.dart";
import "package:opinions/features/registration/view_model/state/login_state.dart";
import "package:opinions/router/routes.dart"; // 1. Use flutter_riverpod for UI widgets

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState(); // 2. Fixed 'ConsumState' typo
}

// 3. Changed 'State<LoginScreen>' to 'ConsumerState<LoginScreen>'
class _LoginScreenState extends ConsumerState<LoginScreen> {
  late TextEditingController usernameController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<LoginState>(loginProvider, (previous, next) {
      switch (next.loginState) {
        case (LoginStatusEnums.success):
          context.go(AppRoutes.homeScreen);
          break;

        case (LoginStatusEnums.error):
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Error"),
                content: const Text("Invalid username or password"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("OK"),
                  ),
                ],
              );
            },
          );
          break;

        case (LoginStatusEnums.doesNotExist):
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Error"),
                content: const Text("User does not exist"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("OK"),
                  ),
                ],
              );
            },
          );
          break;

        default:
          break;
      }
    });

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [Colors.red, Colors.purple]),
          ),
          // 1. LayoutBuilder reads the maximum available screen height
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  // 2. Forces the inner canvas to be exactly as tall as the screen
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                      25,
                      MediaQuery.of(context).padding.top + 16,
                      20,
                      25,
                    ),
                    child: Column(
                      // 3. Pushes everything between top and bottom blocks outward
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Sub-column holding upper form contents
                        Column(
                          children: [
                            // header
                            Container(
                              padding: const EdgeInsets.fromLTRB(
                                15,
                                20,
                                15,
                                10,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.3),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: const Column(
                                children: [
                                  Center(
                                    child: Text(
                                      "Opinions",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 33,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // sign in - sign up
                            Padding(
                              padding: const EdgeInsets.only(top: 100),
                              // Adjusted slightly for cleaner layout flow
                              child: Container(
                                padding: const EdgeInsets.fromLTRB(
                                  15,
                                  20,
                                  15,
                                  20,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.3),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Column(
                                  children: [
                                    const Text(
                                      "Enter your username",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    const Text("phone number / email"),
                                    const SizedBox(height: 10),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        color: Colors.white.withValues(
                                          alpha: 0.5,
                                        ),
                                      ),
                                      child: TextField(
                                        controller: usernameController,
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          contentPadding: EdgeInsets.symmetric(
                                            horizontal: 10,
                                          ),
                                        ),
                                        onChanged: (value) {
                                          // final loginNotifier = ref.read(
                                          //   loginProvider.notifier,
                                          // );
                                          // loginNotifier.enteredUsername(value);
                                        },
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    const Divider(color: Colors.white),
                                    const SizedBox(height: 10),
                                    const Text("Enter your password"),
                                    const SizedBox(height: 10),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        color: Colors.white.withValues(
                                          alpha: 0.5,
                                        ),
                                      ),
                                      child: TextField(
                                        controller: passwordController,
                                        obscureText: true,
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          contentPadding: EdgeInsets.symmetric(
                                            horizontal: 10,
                                          ),
                                        ),
                                        onChanged: (value) {
                                          // final loginNotifier = ref.read(
                                          //   loginProvider.notifier,
                                          // );
                                          // loginNotifier.enteredPassword(value);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                        // 4. This container is now pinned cleanly to the bottom end
                        // this is the submitted button
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                context.push(AppRoutes.signUpScreen);
                                ref.invalidate(loginProvider);
                              },
                              child: Text(
                                "Sign up",
                                style: TextStyle(
                                  color: Colors.black26,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            GestureDetector(
                              onTap: () {
                                final loginNotifier = ref.read(
                                  loginProvider.notifier,
                                );

                                print(usernameController.text);
                                print(passwordController.text);

                                // this will attempt login
                                loginNotifier.userLogin(
                                  usernameController.text,
                                  passwordController.text,
                                );
                              },
                              child: Container(
                                margin: const EdgeInsets.only(top: 20),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 15,
                                ),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white.withValues(alpha: 0.5),
                                ),
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
