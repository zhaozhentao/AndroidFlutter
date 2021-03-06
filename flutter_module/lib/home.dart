import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_module/body.dart';

class Home extends StatelessWidget {
  Home() {
    request();
  }

  void request() async {
    HttpClient client = HttpClient();
    Uri uri = Uri(
        scheme: "https",
        host: "flutterchina.club",
        queryParameters: {"xx": "xx", "yy": "dd"});
    HttpClientRequest request = await client.getUrl(uri);
    HttpClientResponse response = await request.close();
    String responseBody = await response.transform(utf8.decoder).join();
    print(responseBody);
    client.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfff8faf8),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.camera_alt),
          onPressed: () {
            var msg = {'cmd': 'page_change', 'last_page': true};

            BasicMessageChannel('my', StringCodec()).send(json.encode(msg));
            print(Navigator.canPop(context));
          },
        ),
        title: SizedBox(
          height: 35,
          child: Image.asset("assets/images/insta_logo.png"),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {},
          )
        ],
      ),
      body: InsList(),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(icon: Icon(Icons.home), onPressed: () {}),
            IconButton(icon: Icon(Icons.search), onPressed: () {}),
            IconButton(icon: Icon(Icons.add_box), onPressed: () {}),
            IconButton(icon: Icon(Icons.favorite), onPressed: () {}),
            IconButton(icon: Icon(Icons.account_box), onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
