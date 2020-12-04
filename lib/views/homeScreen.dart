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
      'photoUrl': 'assets/images/news1.png',
      'title': 'For physically disabled gamers, the Switch is incredibly accessible.',
      'shortDescription': 'Washington Post: Writer with Spinal Muscular Atrophy Type II praises Nintendo Switch.',
      'timeInfo':'3 mins ago',
      'commentInfo': '50 comments',
      'tileIndex': 1
    },
    {
      'photoUrl': 'assets/images/news2.png',
      'title': 'Last of Us Part II: Is this the most accessible game ever?',
      'shortDescription': 'BBC: \"The first time Steve Saylor fired up the hotly-anticipated new game The Last of Us Part II, he burst into tears.\"',
      'timeInfo':'5 mins ago',
      'commentInfo': '7 comments',
      'tileIndex': 2
    },
    {
      'photoUrl': 'assets/images/news3.jpg',
      'title': 'Not so white, male and straight: the video games industry is changing',
      'shortDescription': 'The Guardian: BAME and LGBTQ+ representation is above the average for the UK’s creative industries, while the number of women in the games industry is creeping upwards.',
      'timeInfo':'8 mins ago',
      'commentInfo': '15 comments',
      'tileIndex': 3
    },
    {
      'photoUrl': 'assets/images/news4.png',
      'title': 'A History Of Accessibility In Video Games.',
      'shortDescription': '\"The subject of accessibility in games has arguably been an ongoing one since the medium\'s very beginning\"',
      'timeInfo':'13 mins ago',
      'commentInfo': '15 comments',
      'tileIndex': 4
    },
    {
      'photoUrl': 'assets/images/news5.png',
      'title': 'Breaking Misconceptions About Accessibility With AbleGamers\' Greg Haynes.',
      'shortDescription': '\"We’re talking about being able to remove barriers to play\"',
      'timeInfo':'3 mins ago',
      'commentInfo': '5 comments',
      'tileIndex': 5
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
              commentInfo: newsInfo['commentInfo'],
              tileIndex: newsInfo['tileIndex']
            ),
          )
          )

        ],
      ),
        drawer: MyDrawer ()
      );
  }
}