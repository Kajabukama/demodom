import 'package:demodom/models/users_model.dart';
import 'package:flutter/material.dart';

class ContactTabScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
                title:
                    Text(users[index].firstname + " " + users[index].lastname),
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
    );
  }
}
