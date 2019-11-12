import 'package:demodom/screens/home_tabs/tabs/contacts_tab.dart';
import 'package:demodom/screens/home_tabs/tabs/home_tab.dart';
import 'package:demodom/screens/home_tabs/tabs/messages_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class HomeTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        initialIndex: 1,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.indigo,
            title: Text("Dashboard"),
            centerTitle: true,
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  text: "Home",
                  // icon: Icon(Feather.getIconData("home")),
                ),
                Tab(
                  text: "Contacts",
                  // icon: Icon(Feather.getIconData("book")),
                ),
                Tab(
                  text: "Messages",
                  // icon: Icon(Feather.getIconData("message-square")),
                )
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              HomeTabScreen(),
              ContactTabScreen(),
              MessageTabScreen()
            ],
          ),
        ));
  }
}
