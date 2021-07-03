import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IndexRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Index"),
      ),
      body: Center(
        child: FlatButton(
          onPressed: () {
            BasicMessageChannel('my', StringCodec()).send("给你发消息啦");
          },
          child: Text("发送"),
        ),
      ),
    );
  }
}
