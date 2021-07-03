import 'package:flutter/material.dart';

class IndexRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Index"),
      ),
      body: Center(
        child: Text("这是一个新页面"),
      ),
    );
  }
}
