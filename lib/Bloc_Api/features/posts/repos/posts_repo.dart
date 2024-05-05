import 'dart:convert';
import 'package:dealdox_integrated/Bloc_Api/features/posts/mappers/post_data_ui_model.dart';
import 'package:http/http.dart' as http;

class PostRepo{
  static Future<List<PostDataUiModel>> fetchPosts() async{
    var client = http.Client();
    List<PostDataUiModel> posts = [];

    try {
      var response = await client.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      );
      final result = jsonDecode(response.body); //json -> list of maps
      for (int i = 0; i < result.length; i++) {
        PostDataUiModel post =
        PostDataUiModel.fromJson(result[i] as Map<String, dynamic>);
        posts.add(post);
      }
  }catch(e){
      print(e.toString());
    }
    return posts;
    }
}