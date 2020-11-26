import 'package:access_granted/helper/constants.dart';
import 'package:access_granted/helper/drawer.dart';
import 'package:access_granted/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:access_granted/widgets/newsTile.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  List <Map> newsCollection = [
    {
      'photoUrl': 'assets/images/news1.jpg',
      'title': 'God Of War',
      'shortDescription': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      'timeInfo':'3 mins ago',
      'commentInfo': '50 comments'
    },
    {
      'photoUrl': 'assets/images/news2.jpg',
      'title': 'Age Of Empires',
      'shortDescription': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      'timeInfo':'5 mins ago',
      'commentInfo': '7 comments'
    },
    {
      'photoUrl': 'assets/images/news3.jpg',
      'title': 'Super Mario',
      'shortDescription': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      'timeInfo':'8 mins ago',
      'commentInfo': '15 comments'
    },
    {
      'photoUrl': 'assets/images/news4.jpg',
      'title': 'Attack On Titan',
      'shortDescription': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      'timeInfo':'13 mins ago',
      'commentInfo': '15 comments'
    },
    {
      'photoUrl': 'assets/images/news5.jpg',
      'title': 'Call Of Duty',
      'shortDescription': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      'timeInfo':'3 mins ago',
      'commentInfo': '5 comments'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Text('Latest News', style: TextStyle(fontSize: 24, color: Color(Constants.colors['green'])),),
          SizedBox(height: 15,),
          ...newsCollection.map((newsInfo) => Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
            child: NewsTile(
              photoUrl: newsInfo['photoUrl'],
              title: newsInfo['title'],
              shortDescription: newsInfo['shortDescription'],
              timeInfo: newsInfo['timeInfo'],
              commentInfo: newsInfo['commentInfo']
            ),
          ))
        ],
      ),
        drawer: MyDrawer ()
      );
  }
}