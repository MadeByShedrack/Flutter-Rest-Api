import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/albums.dart';

Future<Albums> fetchAlbums() async {
  final response = await http.get(Uri.parse(
    "https://jsonplaceholder.typicode.com/albums/1",
  ));
  if (response.statusCode == 200) {
    return Albums.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Failed to load albums");
  }
}
