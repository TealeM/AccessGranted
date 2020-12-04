import 'package:flutter/material.dart';
import 'package:access_granted/helper/constants.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsTile extends StatelessWidget{

  final String photoUrl, title, shortDescription, timeInfo, commentInfo;
  final int tileIndex;

  NewsTile({this.tileIndex, this.photoUrl, this.title, this.shortDescription, this.timeInfo, this.commentInfo});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: (){
          switch (tileIndex){
            case 1: launch('https://www.washingtonpost.com/video-games/2020/04/21/accessibility-gaming-nintendo-switch/');
            break;

            case 2: launch('https://www.bbc.com/news/technology-53093613');
            break;

            case 3: launch('https://www.theguardian.com/games/2020/feb/19/video-games-industry-diversity-women-people-of-colour');
            break;

            case 4: launch('https://www.gamingbible.co.uk/features/games-for-all-the-players-a-history-of-accessibility-in-video-games-20200124');
            break;

            case 5: launch('https://gdconf.com/news/breaking-misconceptions-about-accessibility-ablegamers-greg-haynes-gdc-podcast-ep-12');
            break;

          }
        },
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(photoUrl),
            Container(
              padding: EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Wrap(
                  //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text(title, style: TextStyle(fontSize: 18),),],
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    children: [Flexible(child: Text(shortDescription, style: TextStyle(fontSize: 14)))],
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FlatButton.icon(onPressed: (){}, icon: Icon(Icons.timer, size: 16,), label: Text(timeInfo, style: TextStyle(fontSize: 12))),
                FlatButton.icon(onPressed: (){}, icon: Icon(Icons.comment, size: 16,), label: Text(commentInfo, style: TextStyle(fontSize: 12))),
              ],
            ),
          ],
        ),
      ),
    );
  }

}