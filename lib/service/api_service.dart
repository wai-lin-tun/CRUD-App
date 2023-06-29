import 'dart:convert';
import 'package:crud_testing/constant/string.dart';
import 'package:crud_testing/model/post_model.dart';
import 'package:http/http.dart' as http;

class APIService {
  Future<PostModel> createPost(String title, String body) async {
    final response = await http.post(
      Uri.parse(createUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{'title': title, 'body': body}),
    );

    if (response.statusCode == 201) {
      return postModelFromJson(response.body);
    } else {
      throw Exception('Failed to create album.');
    }
  }

  Future<PostModel> getPost() async {
    var url = Uri.parse(baseUrl);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return postModelFromJson(response.body);
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<PostModel> updatePost(String name, String body) async {
    final response = await http.put(
      Uri.parse(updateUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{'title': name, 'body': body}),
    );

    if (response.statusCode == 200) {
      return postModelFromJson(response.body);
    } else {
      throw Exception('Failed to update album.');
    }
  }

  Future<PostModel> deletePost(String id) async {
    final http.Response response = await http.delete(
      Uri.parse('https://jsonplaceholder.typicode.com/posts/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      return postModelFromJson(response.body);
    } else {
      throw Exception('Failed to delete album.');
    }
  }
}
