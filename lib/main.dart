import 'package:flutter/material.dart';

void main() => runApp(new ArrangePortalAdminApp());

class ArrangePortalAdminApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("Arrange Portal Admin"),
        ),
        body: new Center(
          child: new Text("Hallo Welten!"),
        ),
      ),
    );
  }

}