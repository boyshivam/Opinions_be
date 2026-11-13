import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:opinions/features/registration/view_model/provider/login_provider.dart";
import "package:opinions/utils/helper_functions/generic_nav_button.dart"; // 1. Use flutter_riverpod for UI widgets

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState(); // 2. Fixed 'ConsumState' typo
}

// 3. Changed 'State<SignUpScreen>' to 'ConsumerState<SignUpScreen>'
class _SignUpScreenState extends ConsumerState<SignUpScreen> {
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
    final loginNotifier = ref.read(loginProvider.notifier);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Container(
          constraints: BoxConstraints.expand(),
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [Colors.red, Colors.purple]),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                      25,
                      MediaQuery.of(context).padding.top + 16,
                      20,
                      25,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // header
                        Container(
                          padding: const EdgeInsets.fromLTRB(15, 20, 15, 10),
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
                        Container(
                          padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.3),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            children: [
                              const Text(
                                "Fill user details:",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                ),
                              ),
                              const SizedBox(height: 10),

                              const Text("Enter email"),
                              const SizedBox(height: 10),
                              // username textfield
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.white.withValues(alpha: 0.5),
                                ),
                                child: TextField(
                                  controller: usernameController,
                                  // 4. Hooked up controller
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
                              // passcode textfield
                              const Text("Enter password"),
                              const SizedBox(height: 10),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.white.withValues(alpha: 0.5),
                                ),
                                child: TextField(
                                  controller: passwordController,
                                  // 5. Hooked up controller
                                  obscureText: true,
                                  // Optional: hides password typing
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

                        GestureDetector(
                          onTap: () {
                            final loginNotifier = ref.read(
                              loginProvider.notifier,
                            );

                            loginNotifier.submitInput();
                          },
                          child: GenericNavButton(ctaText: "Login"),
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
