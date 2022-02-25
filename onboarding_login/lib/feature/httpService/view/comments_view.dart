import 'package:flutter/material.dart';
import 'package:onboarding_login/feature/httpService/model/comment_model.dart';
import 'package:onboarding_login/feature/httpService/service/commets_service.dart';

class CommentsView extends StatefulWidget {
  const CommentsView({Key? key}) : super(key: key);
  static const String routeName = '/comments';

  @override
  State<CommentsView> createState() => _CommentsViewState();
}

class _CommentsViewState extends State<CommentsView> {
  final CommentService _service = CommentService();
  List<Comment> _commentList = [];
  String title = "Comments";

  _init() async {
    _commentList = await _service.getFetch;
  }

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          centerTitle: true,
        ),
        body: SafeArea(
          maintainBottomViewPadding: true,
          child: ListView.builder(
            itemCount: _commentList.length,
            itemBuilder: (context, index) {
              return _buildListItem(context, index);
            },
          ),
        ));
  }

  Widget _buildListItem(BuildContext context, int index) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _commentList[index].name ?? '',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(_commentList[index].body ?? ''),
          ],
        ),
      ),
    );
  }
}
