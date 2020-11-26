import 'package:access_granted/helper/constants.dart';
import 'package:access_granted/helper/drawer.dart';
import 'package:flutter/material.dart';
import 'package:access_granted/widgets/editableLabeledInfo.dart';
import 'package:access_granted/widgets/iconNumberCard.dart';
import 'package:access_granted/helper/helperfunctions.dart';
import 'package:access_granted/services/database.dart';

class UserProfile extends StatefulWidget{

  //user profile details
  final String docId, name, title, bio;
  UserProfile({this.docId, this.name, this.title, this.bio});


  @override
  //set initial state from final arguments
  _UserProfileState createState() => _UserProfileState(docId: this.docId, name: this.name, title: this.title, bio: this.bio);
}

class _UserProfileState extends State<UserProfile> {

  String docId, name, title, bio;
  //determines if current user can edit current profile
  bool canEditProfile = false;
  //determines if current user is editing profile
  bool editMode = false;
  //determines if user profile is being updated
  bool isUpdating = false;

  _UserProfileState({this.docId, this.name, this.title, this.bio});

  @override
  void initState() {
    //verify if current user is accessing their own profile
    HelperFunctions.getUserDocumentIdSharedPreference().then((_docId) {
      if(_docId == docId){
        setState(() {
          canEditProfile = true;
        });
      }
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile')
      ),
      floatingActionButton: canEditProfile ? FloatingActionButton(
        onPressed: () {
          if(isUpdating) return;
          if(!editMode){
            setState(() {
              editMode = true;
            });
          }else{
            isUpdating = true;
            Map <String, String> userProfileMap = {'docId':docId, 'name': name, 'title': title, 'bio': bio};
            (new DatabaseMethods()).updateUserInfo(userProfileMap).then((val){
              HelperFunctions.updateUserSharedPreferenceProfile(userProfileMap).then((success){
                if(success){
                  setState(() {
                    editMode = false;
                    isUpdating = false;
                  });
                }
              });
            }).catchError((e) {
              print(e.toString());
            });
          }
        },
        backgroundColor: Color(Constants.colors['green']),
        child: editMode ? Icon(Icons.save, size: 24) : Icon(Icons.create, size: 24),
      ) : null,
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            color: Color(Constants.colors['lessBlack']),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundColor: Color(Constants.colors['black']),
                  backgroundImage: AssetImage('assets/images/avatar.png')
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
                EditableLabeledInfo(
                  label: 'name',
                  info: name,
                  editable: editMode,
                  handleChange: editMode ? (val) {
                    name = val;
                  } : null
                ),
                SizedBox(height:25.0),
                EditableLabeledInfo(
                  label: 'Title',
                  info: title,
                  editable: editMode,
                  handleChange: editMode ? (val) {
                    title = val;
                  } : null
                ),
                SizedBox(height:25.0),
                EditableLabeledInfo(
                  label: 'about me',
                  info: bio,
                  infoFontSize: 14.0,
                  editable: editMode,
                  handleChange: editMode ? (val) {
                    bio = val;
                  } : null
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