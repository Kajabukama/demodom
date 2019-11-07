import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  ContactScreen({Key key}) : super(key: key);
  String value = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Contact Details"),
          centerTitle: true,
          backgroundColor: Color(0xffff2757),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    labelText: "Email address",
                    hintText: "Your email address",
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (text) {
                    value = text;
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "Your user password",
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (text) {
                    value = text;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
