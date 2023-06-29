import 'package:crud_testing/model/post_model.dart';
import 'package:crud_testing/service/api_service.dart';
import 'package:flutter/material.dart';

class PostProvider with ChangeNotifier {
  APIService apiService = APIService();
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  Future<PostModel>? futurePost;

  readPost() {
    futurePost = apiService.getPost();
    notifyListeners();
  }

  postCreate() {
    futurePost =
        apiService.createPost(titleController.text, bodyController.text);
    notifyListeners();
  }

  postUpdate() {
    futurePost =
        apiService.updatePost(titleController.text, bodyController.text);
    notifyListeners();
  }

  postDelete(context, String id) {
    futurePost = apiService.deletePost(id);
    titleController.clear();
    bodyController.clear();

    notifyListeners();
  }
}
