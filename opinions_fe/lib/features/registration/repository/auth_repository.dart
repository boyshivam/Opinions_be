import "dart:convert";
import "package:http/http.dart" as http;




class AuthRepository {
  AuthRepository({required this.client});

  final http.Client client;


  // login functionality
  Future<String> login(String username, String password) async {
    final url = Uri.parse("http://10.0.2.2:8000/login/");

    final http.Response response = await http.post(
      url,
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: {"username": username, "password": password},
    );


    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = jsonDecode(response.body);
      final token = data["access_token"] as String;
      return token;


    }
    if  (response.statusCode == 401) {
      throw Exception("Invalid credentials");
    }
    if (response.statusCode == 404) {
      throw Exception("User does not exist");
    }
    throw Exception("Login failed");
  }
}

// create a new user
// Future<void> createUser(UserModel user, userCreated) async {
//   final url = Uri.parse("http://10.0.2.2:8000/user/");
//
//   final http.Response response = await http.post(
//     url,
//     headers: {"Content-Type": "application/json"},
//     body: jsonEncode({"username": user.username, "password": user.password}),
//   );
//
//   if (response.statusCode == 200 || response.statusCode == 201) {
//     userCreated = true;
//     print("Successfully created");
//   } else {
//     print("Failed miserably ${response.body}");
//     userCreated = false;
//   }
// }
//
//
// // this will login a user and generate an access token
//
//
//
//
// // fetch a user
// Future<void> fetchUser(String username, String password) async {
//   final url = Uri.parse("http://10.0.2.2:8000/user/$username/$password");
//
//   final http.Response response = await http.get(url);
//
//   if (response.statusCode == 200 || response.statusCode == 201) {
//     print("user_exists");
//
//     final data = jsonDecode(response.body) as Map<String, dynamic>;
//     final token = data["accessToken"] as String;
//     print(token);
//   } else if (response.statusCode == 404) {
//     print("user does not exist");
//   } else {
//     print("Error: ${response.statusCode}");
//   }
// }
//
// // delete an existing user
// Future<void> deleteUser(String username) async {
//   final url = Uri.parse("http://10.0.2.2:8000/user/{username}");
//
//   final http.Response response = await http.delete(
//     url,
//     body: jsonEncode({"username": username}),
//   );
//
//   if (response.statusCode == 200 || response.statusCode == 201) {
//     print("Successfully deleted user");
//   } else {
//     print("Unable to delete user ${response.body}");
//   }
// }
