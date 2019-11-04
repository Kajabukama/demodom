import 'package:demodom/models/users_model.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String title;
  HomeScreen({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffff2757),
        elevation: 0.0,
        title: Text("Users"),
        centerTitle: true,
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        reverse: true,
        itemCount: users.length,
        itemBuilder: (BuildContext context, index) => ListTile(
          onTap: () {
            print("object");
            AlertDialog(
              title: Text(users[index].firstname),
            );
          },
          trailing: Icon(Icons.chevron_right),
          title: Text(users[index].firstname + " " + users[index].lastname),
          subtitle: Text(users[index].imageUrl),
          leading: CircleAvatar(
            backgroundImage: AssetImage(
              users[index].imageUrl,
            ),
          ),
        ),
      ),
    );
  }
}
