import 'package:http/http.dart' as http;
import 'package:onboarding_login/feature/httpService/model/comment_model.dart';

class CommentService {
  Future get getFetch => _getFetchComments();

  Future<List<Comment>> _getFetchComments() async {
    const baseUrl = "https://jsonplaceholder.typicode.com/";
    const uri = baseUrl + "comments";
    var response = await http.get(Uri.parse(uri));
    if (response.statusCode == 200) {
      List<Comment> list = [];
      list = commentFromJson(response.body);
      return list;
    } else {
      throw Exception('Failed to load comments');
    }
  }
}
