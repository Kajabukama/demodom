import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CreatePostScreen extends StatefulWidget {
  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final _formKey = GlobalKey<FormState>();
  String _title, _body;
  int userId = 10;
  String url = "https://jsonplaceholder.typicode.com/posts";
  Map<String, String> headers = {"Content-type": "application/json"};

  _onSubmit() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      String json =
          '{"title":' + _title + ', "body":' + _body + ', "userId": 1}';
      var response = await http.post(url, headers: headers, body: json);
      if (response.statusCode == 200) {
        print(response.body);
      } else {
        print("Sorry did not succeed");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: Text(
                "Create a Post",
                style: TextStyle(fontSize: 26.0),
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Title",
                        hintText: "Post title",
                      ),
                      validator: (input) =>
                          input.isEmpty ? "Must not be empty" : null,
                      onSaved: (input) => _title = input,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Body",
                        hintText: "Post body",
                      ),
                      validator: (input) =>
                          input.isEmpty ? "Must not be empty" : null,
                      onSaved: (input) => _body = input,
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.0, vertical: 26.0),
                    width: MediaQuery.of(context).size.width,
                    child: FlatButton(
                      onPressed: _onSubmit,
                      child: Text("Create Post"),
                      color: Colors.amber,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
