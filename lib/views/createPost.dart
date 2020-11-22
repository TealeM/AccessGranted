import 'package:flutter/material.dart';
import 'package:access_granted/helper/constants.dart';
import 'package:access_granted/helper/drawer.dart';

class CreatePost extends StatefulWidget {
  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  final _formKey = GlobalKey<FormState>();

  //will contain form input data after validation
  String title = '';
  String gameDescription = '';
  String consultDescription = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Post'),
      ),
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
                      'Give Us The Details',
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
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      hintText: 'Enter a post title',
                      labelText: 'Title',
                    ),
                    onChanged: (value) {
                      setState(() {
                        title = value;
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
                      gameDescription = value;
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
                      consultDescription = value;
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
                        print('-----------------');
                        print('--- VALIDATED ---');
                        print('-----------------');
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