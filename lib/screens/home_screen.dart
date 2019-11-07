import 'package:demodom/models/users_model.dart';
import 'package:demodom/screens/contact_screen.dart';
import 'package:demodom/screens/news_screen.dart';
import 'package:demodom/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

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
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ContactScreen(),
              ),
            );
          },
          icon: Icon(
            Icons.edit,
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => RegistrationScreen(),
              ),
            ),
            icon: Icon(
              Feather.getIconData("home"),
            ),
          ),
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => NewsScreen(),
              ),
            ),
            icon: Icon(Icons.more_vert),
          )
        ],
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        reverse: false,
        itemCount: users.length,
        itemBuilder: (BuildContext context, index) => ListTile(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  elevation: 18.0,
                  title: Text(
                      users[index].firstname + " " + users[index].lastname),
                  content: Text(users[index].content),
                  actions: <Widget>[
                    new FlatButton(
                      child: new Text("Close"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          },
          trailing: Icon(Icons.chevron_right),
          title: Text(users[index].firstname + " " + users[index].lastname),
          subtitle: Text(
            users[index].content,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
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
