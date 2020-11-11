import 'package:access_granted/helper/constants.dart';
import 'package:access_granted/helper/drawer.dart';
import 'package:flutter/material.dart';
import 'package:access_granted/widgets/labeledInfo.dart';
import 'package:access_granted/widgets/iconNumberCard.dart';

class UserProfile extends StatefulWidget{

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile')
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            color: Color(Constants.colors['lessBlack']),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 70,
                ),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconNumberCard(
                      icon: Icons.star,
                      number: "4.5",
                      description: "Average Rating",
                      handleClick: (){
                        print("clicked");
                      },
                    ),
                    IconNumberCard(
                      icon: Icons.work,
                      number: "25",
                      description: "Total Projects",
                      handleClick: (){
                        print("clicked");
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(30),
            child: Column(
              children: [
                LabeledInfo(
                  label: 'name',
                  info: 'James Aberefa',
                ),
                SizedBox(height:25.0),
                LabeledInfo(
                  label: 'Title',
                  info: 'N/A',
                ),
                SizedBox(height:25.0),
                LabeledInfo(
                  label: 'about me',
                  info: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
                  infoFontSize: 14.0,
                ),
              ],
            ),
          )
        ],
      ),
      drawer: MyDrawer ()
    );
  }
}