import 'package:access_granted/helper/authenticate.dart';
import 'package:access_granted/helper/constants.dart';
import 'package:access_granted/helper/helperfunctions.dart';
import 'package:access_granted/services/auth.dart';
import 'package:access_granted/views/aboutUs.dart';
import 'package:access_granted/views/developerProfile.dart';
import 'package:access_granted/views/search.dart';
import 'package:access_granted/views/chatRoomsScreen.dart';
import 'package:access_granted/views/userProfile.dart';
import 'package:access_granted/views/createPost.dart';
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
      //determine user type
      HelperFunctions.getUserTypeSharedPreference().then((_userType) {
      if(_userType != null){
          setState(() {
            userType = _userType;
          });
         }
      });
      super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          width: 200,
          child: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Color(Constants.colors['black']), //This will change the drawer background to blue.
              //other styles
            ),
            child: Drawer(
              child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    ListTile(
                      title: Text('Home', style: TextStyle(fontSize: 18, color: Color(Constants.colors['green']))),
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => HomeScreen())
                        );
                      },
                    ),
                    (userType == Constants.DEV_USER ?
                    ListTile(
                      title: Text('Create A Post', style: TextStyle(fontSize: 18, color: Color(Constants.colors['green']))),
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => CreatePost())
                        );
                      },
                    ) : Container()),
                    ListTile(
                      title: Text('My Profile', style: TextStyle(fontSize: 18, color: Color(Constants.colors['green']))),
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
                      title: Text('Search Users', style: TextStyle(fontSize: 18, color: Color(Constants.colors['green']))),
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchScreen())
                        );
                      },
                    ),
                    ListTile(
                      title: Text('Messages', style: TextStyle(fontSize: 18, color: Color(Constants.colors['green']))),
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChatRoomScreen())
                        );
                      },
                    ),
                    ListTile(
                      title: Text('About Us', style: TextStyle(fontSize: 18, color: Color(Constants.colors['green']))),
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
          ),
      ),
    );
      //),
    //);
  }
}