import 'dart:io';

import 'package:access_granted/helper/helperfunctions.dart';
import 'package:access_granted/services/auth.dart';
import 'package:access_granted/services/database.dart';
import 'package:access_granted/widgets/widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:access_granted/helper/constants.dart';
import 'package:access_granted/helper/drawer.dart';

import 'homeScreen.dart';

class CreatePost extends StatefulWidget {
  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {

  DatabaseMethods databaseMethods = new DatabaseMethods();
  AuthMethods authMethods = new AuthMethods();

  final _formKey = GlobalKey<FormState>();

  String postTitle;
  String postGameDesc;
  String postConsDesc;
  String postDevID;

  createPost() async {
    if(_formKey.currentState.validate()) {

      postDevID = await authMethods.getUID();
      Map<String, String> postInfoMap = {
        "title": postTitle,
        "gamedesc": postGameDesc,
        "consdesc": postConsDesc,
        "devid": postDevID
      };

      HelperFunctions.savePostTitleSharedPreference(postTitle);
      HelperFunctions.savePostGameDescSharedPreference(postGameDesc);
      HelperFunctions.savePostConsDescSharedPreference(postConsDesc);

      // setState(() {
      //   isLoading = true;
      // });

      databaseMethods.uploadPostInfo(postInfoMap);
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: Form(
        key: _formKey,
        child: Scrollbar(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Provide details for your new post.',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(Constants.colors['white']),
                      ),
                    ),
                    Icon(
                      Icons.create,
                      size: 24,
                      color: Color(Constants.colors['white']),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Card(
                  child: TextFormField(
                    validator: (val){
                      return val.isEmpty ? "Invalid input." : null;
                    },
                    //controller: postTitle,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      hintText: 'Enter a post title',
                      labelText: 'Title',
                    ),
                    onChanged: (value) {
                      setState(() {
                        postTitle = value;
                      });
                     },
                  ),
                ),
                SizedBox(height: 20),
                Card(
                  child: TextFormField(
                    validator: (val){
                      return val.isEmpty ? "Invalid input." : null;
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      hintText: 'Tell us about your game',
                      labelText: 'Game Description',
                      alignLabelWithHint: true
                    ),
                    onChanged: (value) {
                      postGameDesc = value;
                    },
                    maxLines: 5,
                  ),
                ),
                SizedBox(height: 20),
                Card(
                  child: TextFormField(
                    validator: (val){
                      return val.isEmpty ? "Invalid input." : null;
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      hintText: 'What type of consultation do you need?',
                      labelText: 'Consultation Description',
                      alignLabelWithHint: true
                    ),
                    onChanged: (value) {
                      postConsDesc = value;
                    },
                    maxLines: 5,
                  ),
                ),
                SizedBox(height: 20),
                ButtonTheme(
                  minWidth: MediaQuery.of(context).size.width,
                  height: 30,
                  padding: EdgeInsets.all(20),
                  buttonColor: Color(Constants.colors['green']),
                  child: RaisedButton(
                    onPressed: () {
                      // Validate returns true if the form is valid, or false
                      // otherwise.
                      if (_formKey.currentState.validate()) {
                        //do post stuff
                        createPost();

                        // print('-----------------');
                        // print('--- VALIDATED ---');
                        // print('-----------------');


                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => (HomeScreen()))
                        );
                      }
                    },
                    child: Text(
                        'Create',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
        drawer: MyDrawer ()
    );
  }
}