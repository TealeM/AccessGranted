import 'package:access_granted/helper/authenticate.dart';
import 'package:access_granted/helper/constants.dart';
import 'package:access_granted/helper/helperfunctions.dart';
import 'package:access_granted/services/auth.dart';
import 'package:access_granted/views/search.dart';
import 'package:access_granted/views/chatRoomsScreen.dart';
import 'package:access_granted/views/userProfile.dart';
import 'package:access_granted/views/homeScreen.dart';
import 'package:access_granted/widgets/widget.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 200,
        height: 750,
        padding: EdgeInsets.only(top: 70),
        child: Drawer(
          child: ListView(
              padding: EdgeInsets.zero,
              children: [
                ListTile(
                  title: Text('Home'),
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen())
                    );
                  },
                ),
                ListTile(
                  title: Text('My Profile'),
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => UserProfile())
                    );
                  },
                ),
                ListTile(
                  title: Text('Postings'),
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SearchScreen())
                    );
                  },
                ),
                ListTile(
                  title: Text('Messages'),
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChatRoomScreen())
                    );
                  },
                ),
                ListTile(
                  title: Text('About Us'),
                  onTap: () {

                  },
                ),
              ]),
        ),
    );
      //),
    //);
  }
  }