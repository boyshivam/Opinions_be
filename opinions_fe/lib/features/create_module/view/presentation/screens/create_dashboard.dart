import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:opinions/features/create_module/enums/post_creation_enums.dart';
import 'package:opinions/features/create_module/view_model/providers/create_post_provider.dart';
import 'package:opinions/router/routes.dart';
import 'package:opinions/utils/helper_functions/common_header.dart';

class CreateDashboardScreen extends ConsumerStatefulWidget {
  const CreateDashboardScreen({super.key});

  @override
  ConsumerState<CreateDashboardScreen> createState() =>
      _CreateDashboardScreenState();
}

class _CreateDashboardScreenState extends ConsumerState<CreateDashboardScreen> {
  // declare text controller to derive values
  final TextEditingController titleTextController = TextEditingController();
  final TextEditingController genreTextController = TextEditingController();
  final TextEditingController contextTextController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ref.listen(createPostProvider, ((previous, next) async {
      switch (next.postStatus) {

        // snack bar msg for success post creation
        case PostCreationEnums.success:
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Post created successfully!"),
              duration: Duration(seconds: 2),
            ),
          );
          context.go(AppRoutes.homeScreen);
          break;

        // pop up dialogue for error response
        case PostCreationEnums.error:
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Error"),
                content: const Text("Post could not be created! Try again."),
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

        case PostCreationEnums.internalServerError:
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Error"),
                content: const Text("Internal server error"),
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

        case PostCreationEnums.loading:
          CircularProgressIndicator();
          break;

        default:
          break;
      }
    }));

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, builder) {
          return SingleChildScrollView(
            child: Column(
              children: [
                CommonHeader(headerText: "Add a post"),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 20,
                        ),
                        child: Column(
                          children: [
                            Text("Title of your post"),
                            TextFormField(
                              controller: titleTextController,
                              maxLength: 30,
                              decoration: InputDecoration(counterText: ""),
                              validator: (value) {
                                if (value == null) {
                                  return "Value cannot be null";
                                }
                                if (value.trim().isEmpty) {
                                  return "Title cannot be empty";
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 20,
                        ),
                        child: Column(
                          children: [
                            Text("Name a genre"),
                            TextFormField(
                              controller: genreTextController,
                              maxLength: 30,
                              decoration: InputDecoration(counterText: ""),
                              validator: (value) {
                                if (value == null) {
                                  return "Value cannot be null";
                                }
                                if (value.trim().isEmpty) {
                                  return "genre cannot be empty";
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 20,
                        ),
                        child: Column(
                          children: [
                            Text("Elaborate on your view"),
                            TextFormField(
                              controller: contextTextController,
                              maxLength: 30,
                              decoration: InputDecoration(counterText: ""),
                              validator: (value) {
                                if (value == null) {
                                  return "Value cannot be null";
                                }
                                if (value.trim().isEmpty) {
                                  return "Context cannot be empty";
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            final createPostNotifier = ref.read(
                              createPostProvider.notifier,
                            );

                            createPostNotifier.addPostData(
                              titleTextController.text,
                              genreTextController.text,
                              contextTextController.text,
                            );
                          }
                        },
                        child: Text("Submit"),
                      ),
                      const SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: () {
                          context.go(AppRoutes.loginScreen);
                        },
                        child: Text("Logout"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
