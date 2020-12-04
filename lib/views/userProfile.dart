import 'package:access_granted/helper/constants.dart';
import 'package:access_granted/helper/drawer.dart';
import 'package:access_granted/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:access_granted/widgets/editableLabeledInfo.dart';
import 'package:access_granted/widgets/iconNumberCard.dart';
import 'package:access_granted/helper/helperfunctions.dart';
import 'package:access_granted/services/database.dart';
import 'dart:io';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UserProfile extends StatefulWidget{

  //user profile details
  final String docId, name, title, bio, avatar;
  UserProfile({this.docId, this.name, this.title, this.bio, this.avatar});


  @override
  //set initial state from final arguments
  _UserProfileState createState() => _UserProfileState(docId: this.docId, name: this.name, title: this.title, bio: this.bio, avatar: this.avatar);
}

class _UserProfileState extends State<UserProfile> {

  String docId, name, title, bio, avatar;
  //determines if current user can edit current profile
  bool canEditProfile = false;
  //determines if current user is editing profile
  bool editMode = false;
  //determines if user profile is being updated
  bool isUpdating = false;

  //determines if an image is being uploaded
  bool imageUploading = false;
  //image picker 
  final picker = ImagePicker();
  //storage uploader
  final FirebaseStorage storage = FirebaseStorage(storageBucket: 'gs://access-granted-b4763.appspot.com');
  //database methods
  final DatabaseMethods db = DatabaseMethods();


  _UserProfileState({this.docId, this.name, this.title, this.bio, this.avatar});

  void _uploadImageAndUpdateProfile(File _croppedFile) async{
    String extension = _croppedFile.path.split('.').last;
    String filePath = 'images/${DateTime.now().millisecondsSinceEpoch}.$extension';
    //show upload spinner and disable upload button
    setState(() { imageUploading = true; });
    //do image upload
    StorageReference ref = storage.ref().child(filePath);
    StorageUploadTask uploadTask = ref.putFile(_croppedFile);
    StorageTaskSnapshot storageTaskSnapshot = await uploadTask.onComplete;
    String downloadUrl = await storageTaskSnapshot.ref.getDownloadURL();
    //prepare to update profile
    Map <String, String> userProfileMap = {'docId':docId, 'avatar': downloadUrl};
    //do profile update
    db.updateUserInfo(userProfileMap).then((val){
      //do shared preference update
      HelperFunctions.updateUserSharedPreferenceProfile(userProfileMap).then((success){
        if(success){
          setState(() {
            //hide upload spinner and enable upload button
            imageUploading = false;
            //update user profile in view
            avatar = userProfileMap['avatar'];
          });
        }
      });
    }).catchError((e) {
      print(e.toString());
    });
  }

  Future <void> _getImage() async{
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _cropImage(File(pickedFile.path));
    }
  }

  Future <void> _cropImage(File _imageFile) async {
    File croppedFile = await ImageCropper.cropImage(
        sourcePath: _imageFile.path,
        aspectRatioPresets: [CropAspectRatioPreset.square,],
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Crop It',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: true),
        iosUiSettings: IOSUiSettings(
          title: 'Crop It',
        ));
    if (croppedFile != null) _uploadImageAndUpdateProfile(croppedFile);
  }

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
            Map <String, String> userProfileMap = {'docId':docId, 'name': name, 'title': title, 'bio': bio};
            db.updateUserInfo(userProfileMap).then((val){
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
                Stack(
                  children: [
                    CircleAvatar(
                        radius: 80,
                        backgroundColor: Color(Constants.colors['black']),
                        backgroundImage: avatar != null ? NetworkImage(avatar) : AssetImage('assets/images/avatar.png')
                    ),
                    InkWell(
                      onTap: (){
                        if(!imageUploading) _getImage();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(Constants.colors['green']),
                            borderRadius: BorderRadius.all(Radius.circular(30.0))
                        ),
                        padding: EdgeInsets.all(8.0),
                        child: imageUploading ? SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white),),
                        ) : Icon(Icons.camera_alt, color: Color(Constants.colors['white']),),
                      ),
                    ),
                  ],
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