import 'package:flutter/material.dart';
import 'package:access_granted/helper/constants.dart';

Widget appBarMain(BuildContext context) {
  return AppBar(title: Image.asset("assets/images/logo.png",
    height: 50,
  ),
    //title: TextField(decoration: textFieldInputDecoration("I can't get images working here"),)
  );
}

InputDecoration textFieldInputDecoration(String hintText){
  return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(
          color: Colors.white54
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Color(Constants.colors['white'])),
      ),
      enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(Constants.colors['white']))
      )
  );
}

TextStyle simpleTextStyle(){
  return TextStyle(
    color: Color(Constants.colors['white']),
    fontSize: 16
  );
}

TextStyle mediumTextStyle(){
  return TextStyle(
  color: Color(Constants.colors['white']),
  fontSize: 17
  );
}