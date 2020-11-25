import 'package:access_granted/helper/constants.dart';
import 'package:access_granted/helper/drawer.dart';
import 'package:access_granted/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:access_granted/widgets/labeledInfo.dart';

class DeveloperProfile extends StatefulWidget{

  @override
  _DeveloperProfileState createState() => _DeveloperProfileState();
}

class _DeveloperProfileState extends State<DeveloperProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
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
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(30),
            child: Column(
              children: [
                LabeledInfo(
                  label: 'name',
                  info: 'Mark Zuckerberg',
                ),
                SizedBox(height:25.0),
                LabeledInfo(
                  label: 'Company',
                  info: 'Facebook',
                ),
                SizedBox(height:25.0),
                LabeledInfo(
                  label: 'Info',
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