import 'dart:convert';
import 'package:demodom/models/post_model.dart';
import 'package:demodom/screens/PostDetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:http/http.dart' as http;

class PostScreen extends StatefulWidget {
  PostScreen({Key key}) : super(key: key);

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  List<Post> listPosts = List();
  bool isloading = false;
  String url = "https://jsonplaceholder.typicode.com/posts";

  _fetchPosts() async {
    setState(() {
      isloading = true;
    });
    final response = await http.get(url);
    if (response.statusCode == 200) {
      listPosts = (json.decode(response.body) as List)
          .map((post) => new Post.fromJson(post))
          .toList();
      setState(() {
        isloading = false;
      });
    } else {
      throw Exception("Failed to load data");
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: () {
              setState(() {
                _fetchPosts();
              });
            },
            iconSize: 20.0,
            icon: Icon(Feather.getIconData("home")),
          )
        ],
        title: Text("List Posts"),
      ),
      body: isloading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: listPosts.length,
              itemBuilder: (BuildContext context, index) {
                final posts = listPosts[index];
                return ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PostDetails(
                          post: posts,
                        ),
                      ),
                    );
                  },
                  title: Text(
                    posts.title,
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    posts.body,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                );
              },
            ),
    );
  }
}
