import 'package:access_granted/helper/authenticate.dart';
import 'package:access_granted/helper/constants.dart';
import 'package:access_granted/helper/helperfunctions.dart';
import 'package:access_granted/services/auth.dart';
import 'package:access_granted/views/aboutUs.dart';
import 'package:access_granted/views/developerProfile.dart';
import 'package:access_granted/views/search.dart';
import 'package:access_granted/views/chatRoomsScreen.dart';
import 'package:access_granted/views/userProfile.dart';
import 'package:access_granted/views/homeScreen.dart';
import 'package:access_granted/widgets/widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  String userType =  Constants.NORMAL_USER;

  @override
  void initState() {
    HelperFunctions.getUserTypeSharedPreference().then((_userType) {
    if(_userType != null){
        userType = _userType;
        }
    });
    super.initState();
  }

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
                  title: Text('Home', style: TextStyle(fontSize: 24, color: Color(0xFF1EA699))),
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen())
                    );
                  },
                ),
                ListTile(
                  title: Text('My Profile', style: TextStyle(fontSize: 24, color: Color(0xFF1EA699))),
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) {
                          if(userType == Constants.NORMAL_USER){
                            return UserProfile();
                          }
                          return DeveloperProfile();
                        })
                    );
                  },
                ),
                ListTile(
                  title: Text('Search Users', style: TextStyle(fontSize: 24, color: Color(0xFF1EA699))),
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SearchScreen())
                    );
                  },
                ),
                ListTile(
                  title: Text('Messages', style: TextStyle(fontSize: 24, color: Color(0xFF1EA699))),
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChatRoomScreen())
                    );
                  },
                ),
                ListTile(
                  title: Text('About Us', style: TextStyle(fontSize: 24, color: Color(0xFF1EA699))),
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AboutUs())
                    );

                  },
                ),
              ]),
        ),
    );
      //),
    //);
  }
}