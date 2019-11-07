import 'package:flutter/material.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        reverse: true,
        physics: BouncingScrollPhysics(),
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 50.0),
                child: CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage("assets/images/mbele.jpg"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: TextField(
                  autofocus: true,
                  obscureText: false,
                  decoration: InputDecoration(
                      labelText: "First Name",
                      hintText: "First Name",
                      border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: TextField(
                  autofocus: true,
                  obscureText: false,
                  decoration: InputDecoration(
                      labelText: "Middle Name",
                      hintText: "Middle Name",
                      border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: TextField(
                  autofocus: true,
                  obscureText: false,
                  decoration: InputDecoration(
                      labelText: "Last Name",
                      hintText: "Last Name",
                      border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: TextField(
                  autofocus: true,
                  obscureText: false,
                  decoration: InputDecoration(
                      labelText: "Mobile Number",
                      hintText: "Mobile Number",
                      border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: TextField(
                  autofocus: true,
                  obscureText: false,
                  decoration: InputDecoration(
                      labelText: "Address",
                      hintText: "Address",
                      border: OutlineInputBorder()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
