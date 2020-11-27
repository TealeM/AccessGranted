import 'package:access_granted/helper/authenticate.dart';
import 'package:access_granted/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:access_granted/helper/constants.dart';


Widget appBarMain(BuildContext context) {
  return AppBar(
    title: Image.asset("assets/images/AGLogo.png",
      height: 50,),
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