import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_module/Index.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.purple),
      routes: {
        'index': (context) {
          return IndexRoute();
        }
      },
      home: MyHomePage(title: 'Flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String page = "/";

  @override
  void initState() {
    super.initState();

    BasicMessageChannel('my', StringCodec()).setMessageHandler((msg) async {
      setState(() => page = msg!);
      return "success";
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (page) {
      case 'index':
        return IndexRoute();
      case '/':
      default:
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Center(
            child: Column(
              children: <Widget>[
                Text(
                  '首页',
                ),
              ],
            ),
          ),
        );
    }
  }
}
