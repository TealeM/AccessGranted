import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HelperFunctions{
  
  static String sharedPreferenceUserLoggedInKey = "ISLOGGEDIN";
  static String sharedPreferenceUserNameKey = "USERNAMEKEY";
  static String sharedPreferenceUserEmailKey = "USEREMAILKEY";
  static String sharedPreferenceUserTypeKey = "USERTYPEKEY";
  static String sharedPreferenceTitleKey = 'TITLE';
  static String sharedPreferenceCompanyNameKey = 'COMPANY_NAME';
  static String sharedPreferenceBioKey = 'BIO';
  static String sharedPreferenceDocumentIdKey = 'DOC_ID';
  static String sharedPreferencePostTitleKey = "POSTTITLEKEY";
  static String sharedPreferencePostGameDescKey = "GAMEDESCKEY";
  static String sharedPreferencePostConsDescKey = "CONSDESCKEY";
  static String sharedPreferenceUserAvatarKey = 'AVATAR_KEY';



  //saving data to sharedPreference

  static Future<bool> saveUserLoggedInSharedPreference(bool isUserLoggedIn) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setBool(sharedPreferenceUserLoggedInKey, isUserLoggedIn);
  }

  static Future<bool> saveUserNameSharedPreference(String userName) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(sharedPreferenceUserNameKey, userName);
  }

  static Future<bool> saveUserEmailSharedPreference(String userEmail) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(sharedPreferenceUserEmailKey, userEmail);
  }

  static Future<bool> saveUserTypeSharedPreference(String userType) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(sharedPreferenceUserTypeKey, userType);
  }


  static void saveOtherSharedPreferenceInfo(QuerySnapshot snapshotUserInfo) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(sharedPreferenceDocumentIdKey, snapshotUserInfo.docs[0].id);
    prefs.setString(sharedPreferenceBioKey, snapshotUserInfo.docs[0].data()["bio"]);
    prefs.setString(sharedPreferenceTitleKey, snapshotUserInfo.docs[0].data()["title"]);
    prefs.setString(sharedPreferenceCompanyNameKey, snapshotUserInfo.docs[0].data()["companyName"]);
    prefs.setString(sharedPreferenceUserAvatarKey, snapshotUserInfo.docs[0].data()["avatar"]);
  }

  static Future<bool> updateUserSharedPreferenceProfile(Map userProfileMap) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool successFlag = true;
    if(userProfileMap.containsKey('email')){
      successFlag = successFlag && await prefs.setString(sharedPreferenceUserEmailKey, userProfileMap['email']);
    }
    if(userProfileMap.containsKey('isLoggedIn')){
      successFlag = successFlag && await prefs.setString(sharedPreferenceUserLoggedInKey, userProfileMap['isLoggedIn']);
    }
    if(userProfileMap.containsKey('userType')){
      successFlag = successFlag && await prefs.setString(sharedPreferenceUserTypeKey, userProfileMap['userType']);
    }
    if(userProfileMap.containsKey('name')){
      successFlag = successFlag && await prefs.setString(sharedPreferenceUserNameKey, userProfileMap['name']);
    }
    if(userProfileMap.containsKey('title')){
      successFlag = successFlag && await prefs.setString(sharedPreferenceTitleKey, userProfileMap['title']);
    }
    if(userProfileMap.containsKey('companyName')){
      successFlag = successFlag && await prefs.setString(sharedPreferenceCompanyNameKey, userProfileMap['companyName']);
    }
    if(userProfileMap.containsKey('bio')){
      successFlag = successFlag && await prefs.setString(sharedPreferenceBioKey, userProfileMap['bio']);
    }
    if(userProfileMap.containsKey('avatar')){
      successFlag = successFlag && await prefs.setString(sharedPreferenceUserAvatarKey, userProfileMap['avatar']);
    }
    return successFlag;
  }



  static Future<bool> savePostTitleSharedPreference(String postTitle) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(sharedPreferencePostTitleKey, postTitle);
  }

  static Future<bool> savePostGameDescSharedPreference(String postGameDesc) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(sharedPreferencePostGameDescKey, postGameDesc);
  }

  static Future<bool> savePostConsDescSharedPreference(String postConsDesc) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(sharedPreferencePostConsDescKey, postConsDesc);
  }


  //getting data from Shared Preference

  static Future<bool> getUserLoggedInSharedPreference() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(sharedPreferenceUserLoggedInKey);
  }

  static Future<String> getUserNameSharedPreference() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(sharedPreferenceUserNameKey);
  }

  static Future<String> getUserEmailSharedPreference() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(sharedPreferenceUserEmailKey);
  }

  static Future<String> getUserTypeSharedPreference() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(sharedPreferenceUserTypeKey);
  }


  static Future<String> getUserDocumentIdSharedPreference() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(sharedPreferenceDocumentIdKey);
  }

  //get user full details
  static Future<Map> getUserProfileFromSharedPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map userInfo = {
      'docId': prefs.getString(sharedPreferenceDocumentIdKey),
      'email': prefs.getString(sharedPreferenceUserEmailKey),
      'isLoggedIn': prefs.getBool(sharedPreferenceUserLoggedInKey),
      'userType': prefs.getString(sharedPreferenceUserTypeKey),
      'name': prefs.getString(sharedPreferenceUserNameKey),
      'title': prefs.getString(sharedPreferenceTitleKey),
      'companyName': prefs.getString(sharedPreferenceCompanyNameKey),
      'bio': prefs.getString(sharedPreferenceBioKey),
      'avatar' : prefs.getString(sharedPreferenceUserAvatarKey)
    };
    return userInfo;
  }

  static Future<String> getPostTitleSharedPreference() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(sharedPreferencePostTitleKey);
  }

  static Future<String> getPostGameDescSharedPreference() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(sharedPreferencePostGameDescKey,);
  }

  static Future<String> getPostConsDescSharedPreference() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(sharedPreferencePostConsDescKey);
  }

}