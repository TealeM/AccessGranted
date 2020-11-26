import 'package:access_granted/helper/constants.dart';
import 'package:access_granted/helper/drawer.dart';
import 'package:access_granted/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:access_granted/widgets/editableLabeledInfo.dart';
import 'package:access_granted/helper/helperfunctions.dart';
import 'package:access_granted/services/database.dart';


class DeveloperProfile extends StatefulWidget{

  //user profile details
  final String docId, name, companyName, bio;
  DeveloperProfile({this.docId, this.name, this.companyName, this.bio});

  @override
  _DeveloperProfileState createState() => _DeveloperProfileState(docId: this.docId, name: this.name, companyName: this.companyName, bio: this.bio);
}

class _DeveloperProfileState extends State<DeveloperProfile> {

  String docId, name, companyName, bio;
  //determines if current user can edit current profile
  bool canEditProfile = false;
  //determines if current user is editing profile
  bool editMode = false;
  //determines if user profile is being updated
  bool isUpdating = false;

  _DeveloperProfileState({this.docId, this.name, this.companyName, this.bio});
  
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
      appBar: appBarMain(context),
        floatingActionButton: canEditProfile ? FloatingActionButton(
          onPressed: () {
            if(isUpdating) return;
            if(!editMode){
              setState(() {
                editMode = true;
              });
            }else{
              isUpdating = true;
              Map <String, String> userProfileMap = {'docId':docId, 'name': name, 'companyName': companyName, 'bio': bio};
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
                    backgroundImage: AssetImage('assets/images/avatar.png'
                    )
                ),
                SizedBox(height: 15.0),
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
                  label: 'Company',
                  info: companyName,
                  editable: editMode,
                  handleChange: editMode ? (val) {
                    companyName = val;
                  } : null
                ),
                SizedBox(height:25.0),
                EditableLabeledInfo(
                  label: 'Info',
                  info:  bio,
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