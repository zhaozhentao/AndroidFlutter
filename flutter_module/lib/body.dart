import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_module/insta_stories.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InsList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InsListState();
}

class InsListState extends State<InsList> {
  bool isPressed = false;

  late SizedBox? story = null;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * 0.15;

    return ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          if (index == 0) {
            if (story == null) {
              story = SizedBox(height: height, child: InstaStories());
            }
            return story as SizedBox;
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                              height: 40.0,
                              width: 40.0,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/header.jpg')))),
                          SizedBox(width: 10),
                          Text("EEEcho",
                              style: TextStyle(fontWeight: FontWeight.bold))
                        ],
                      ),
                      IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
                    ],
                  )),
              Image.asset("assets/images/photo.jpg"),
              Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                            icon: Icon(Icons.favorite),
                            color: Colors.red,
                            onPressed: () {}),
                        IconButton(
                            icon: Icon(FontAwesomeIcons.comment),
                            onPressed: () {}),
                        IconButton(
                            icon: Icon(FontAwesomeIcons.paperPlane),
                            onPressed: () {}),
                      ],
                    ),
                    IconButton(
                        icon: Icon(FontAwesomeIcons.bookmark), onPressed: () {})
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text('Liked by pawankumar, pk and 528,331 others',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    new Container(
                      height: 40.0,
                      width: 40.0,
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new AssetImage("assets/images/header.jpg")),
                      ),
                    ),
                    new SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: new TextField(
                        decoration: new InputDecoration(
                          border: InputBorder.none,
                          hintText: "Add a comment...",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text("1 Day Ago", style: TextStyle(color: Colors.grey)),
              )
            ],
          );
        });
  }
}
