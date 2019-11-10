import 'dart:convert';

import 'package:demodom/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PostDetails extends StatefulWidget {
  final Post post;
  PostDetails({Key key, @required this.post}) : super(key: key);

  @override
  _PostDetailsState createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  String url = "https://jsonplaceholder.typicode.com/posts";
  bool isloading = false;
  Map<String, dynamic> details;

  _fetchById(id) async {
    setState(() {
      isloading = true;
    });

    final response = await http.get(url + "/" + id.toString());
    if (response.statusCode == 200) {
      details = json.decode(response.body);
      print(details);
      setState(() {
        isloading = false;
      });
    } else {
      throw Exception("not available");
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchById(widget.post.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(details['title']),
      ),
      body: isloading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              child: Text(details['body']),
            ),
    );
  }
}
