import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shahayak/screens/post.dart';

class ApiService {
  final String baseUrl =
      'http://192.168.175.245:8000/api/product/product_detail/10';
  Future<List<Post>> fetchPosts() async {
    final response = await http.get(Uri.parse('$baseUrl/posts'));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Post> posts =
          body.map((dynamic item) => Post.fromJson(item)).toList();
      return posts;
    } else {
      throw 'Failed to load posts';
    }
  }
}
