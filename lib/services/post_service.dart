import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/posts.dart';

Future<Posts> getPosts() async {
  final response = await http.get(Uri.parse(
    "https://jsonplaceholder.typicode.com/posts/1",
  ));

  if (response.statusCode == 200) {
    return Posts.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Failed to load album");
  }
}
