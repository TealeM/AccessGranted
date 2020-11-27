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
      'title': 'New accessible features added to God of War!',
      'shortDescription': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      'timeInfo':'3 mins ago',
      'commentInfo': '50 comments'
    },
    {
      'photoUrl': 'assets/images/news2.jpg',
      'title': 'Age Of Empires accessible version releasing next week.',
      'shortDescription': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      'timeInfo':'5 mins ago',
      'commentInfo': '7 comments'
    },
    {
      'photoUrl': 'assets/images/news3.jpg',
      'title': 'Super Mario faces criticism for misrepresenting Italian culture.',
      'shortDescription': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      'timeInfo':'8 mins ago',
      'commentInfo': '15 comments'
    },
    {
      'photoUrl': 'assets/images/news4.jpg',
      'title': 'How Attack On Titan has further marginalized players with ASD.',
      'shortDescription': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      'timeInfo':'13 mins ago',
      'commentInfo': '15 comments'
    },
    {
      'photoUrl': 'assets/images/news5.jpg',
      'title': 'Deaf community shares their experiences playing Call Of Duty.',
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
          // Wrap(children:[
          //   Text('Access Granted', style: TextStyle(fontSize: 32, color: Colors.white),),
          // ]),
          Wrap(children:[
            Text('Connecting developers with the marginalized gaming community.', style: TextStyle(fontSize: 24, color: Color(Constants.colors['green'])),),
          ]),
          Container (
            padding: EdgeInsets.symmetric(vertical:20),
            child: Text('\“We should celebrate neurodiversity. The world would be poorer and life duller if we were all the same.\"  ―Neil Milliken',
                style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic, color: Colors.white)),
          ),


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