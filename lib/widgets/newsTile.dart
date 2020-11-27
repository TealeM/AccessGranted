import 'package:flutter/material.dart';
import 'package:access_granted/helper/constants.dart';

class NewsTile extends StatelessWidget{

  final String photoUrl, title, shortDescription, timeInfo, commentInfo;

  NewsTile({this.photoUrl, this.title, this.shortDescription, this.timeInfo, this.commentInfo});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: (){},
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