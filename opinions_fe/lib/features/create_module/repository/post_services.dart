import "package:http/http.dart" as http;
import "package:opinions/features/create_module/enums/post_creation_enums.dart";
import "package:opinions/features/create_module/models/create_post_model.dart";


import 'dart:convert';

import "package:opinions/features/registration/repository/services/token_storge_service.dart";

// add a post to db
Future<PostCreationEnums> createAPost(CreatePostModel post) async {
  final url = Uri.parse('http://10.0.2.2:8000/post/');

  final tokenStorage = TokenStorgeService();

  final fetchedToken = await tokenStorage.fetchToken();

  if(fetchedToken == null || fetchedToken.isEmpty){
    throw Exception("Token does not exist");
  }

  final response = await http.post(
    url,
    headers:{
      "Authorization" : "Bearer $fetchedToken",
      'Content-Type': 'application/json'},
    body: jsonEncode({

      'title': post.title,
      'context': post.context,
      'genre': post.genre,

    }),
  );

  if (response.statusCode == 200 || response.statusCode == 201) {
    return PostCreationEnums.success;
  }
  else if (response.statusCode == 500) {
    return PostCreationEnums.internalServerError;
  }
  else  {
    print(response.body );
    print(response.statusCode);
    return PostCreationEnums.error;
  }
}
