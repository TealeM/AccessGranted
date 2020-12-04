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
import 'package:flutter/material.dart';

import 'authenticate.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  Map userProfileMap = {};
  AuthMethods authMethods = new AuthMethods();


  @override
  void initState() {
      //retrieve user info from shared preference
      HelperFunctions.getUserProfileFromSharedPreference().then((_userProfileMap) {
          setState(() {
            userProfileMap = _userProfileMap;
          });
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
                    (userProfileMap.isNotEmpty && userProfileMap['userType'] == Constants.DEV_USER ?
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
                              if(userProfileMap.isEmpty) return null;
                              if(userProfileMap['userType'] == Constants.DEV_USER){
                                return DeveloperProfile(
                                    docId: userProfileMap['docId'], // unlikely to be null (every doc has a document id)
                                    name: userProfileMap['name'] ?? 'N/A',
                                    companyName: userProfileMap['companyName'] ?? 'N/A',
                                    bio: userProfileMap['bio'] ?? 'N/A',
                                    avatar: userProfileMap['avatar'],
                                );
                              }
                              return UserProfile(
                                  docId: userProfileMap['docId'], // unlikely to be null (every doc has a document id)
                                  name: userProfileMap['name'] ?? 'N/A',
                                  title: userProfileMap['title'] ?? 'N/A',
                                  bio: userProfileMap['bio'] ?? 'N/A',
                                  avatar: userProfileMap['avatar'],
                              );
                            })
                        );
                      },
                    ),
                    ListTile(
                      title: Text(userProfileMap.isNotEmpty && userProfileMap['userType'] == Constants.DEV_USER ?
                          'Search Users' : 'Search Posts', style: TextStyle(fontSize: 18, color: Color(Constants.colors['green']))),
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
                    ListTile(
                      title: Text('Sign Out', style: TextStyle(fontSize: 18, color: Color(Constants.colors['green']))),
                      onTap: () {
                        authMethods.signOut();
                        Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) => Authenticate()
                        ));
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