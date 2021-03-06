import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:access_granted/helper/constants.dart';
import 'package:access_granted/helper/helperfunctions.dart';

class DatabaseMethods{

  getUserByUsername(String username) async {
    return await FirebaseFirestore.instance.collection("users")
        .where("name", isEqualTo: username).get();
  }




  doSearch(String username) async{
    String userType = Constants.COMMUNITY_USER;
    Map opponents = {
      Constants.COMMUNITY_USER : Constants.DEV_USER,
      Constants.DEV_USER : Constants.COMMUNITY_USER
    };
    await HelperFunctions.getUserTypeSharedPreference().then((_userType) {
      if(_userType != null){
        userType = opponents[_userType];
      }
    });
    if (userType == "community") {
      return await FirebaseFirestore.instance.collection("users")
          .where("name", isEqualTo: username).where(
          "userType", isEqualTo: userType).get();
    } else if (userType == "developer") {
      return await FirebaseFirestore.instance.collection("Posts")
          .where("title", isEqualTo: username).get();
    }
  }

  differentiateUser() async {
    Future userType;
    Map opponents = {
      Constants.COMMUNITY_USER : Constants.DEV_USER,
      Constants.DEV_USER : Constants.COMMUNITY_USER
    };
    await HelperFunctions.getUserTypeSharedPreference().then((_userType) {
      if(_userType != null){
        userType = opponents[_userType];
      }
    });
    return userType;
  }

  getUserByUserEmail(String userEmail) async {
    //print("your email is $userEmail");
    return await FirebaseFirestore.instance.collection("users")
        .where("email", isEqualTo: userEmail).get()
        .catchError((e) {
          print(e.toString());
    });
  }

      //.docs[0].data()["name"]
  uploadUserInfo(userMap) {
    FirebaseFirestore.instance.collection("users")
        .add(userMap).catchError((e) {
      print(e.toString());
    });
  }

  updateUserInfo(userMap) {
    return FirebaseFirestore.instance.collection("users").doc(userMap['docId']).update(userMap);
  }

    createChatRoom(String chatRoomId, chatRoomMap){
      FirebaseFirestore.instance.collection("ChatRoom")
          .doc(chatRoomId).set(chatRoomMap).catchError((e){
            print(e.toString());
      });
    }

    addConversationMessages(String chatRoomId, messageMap) {
      FirebaseFirestore.instance.collection("ChatRoom")
          .doc(chatRoomId)
          .collection("chats")
          .add(messageMap).catchError((e){print(e.toString());});
    }

    getConversationMessages(String chatRoomId) async {
      return await FirebaseFirestore.instance.collection("ChatRoom")
        .doc(chatRoomId)
        .collection("chats")
        .orderBy("time",descending: false)
        .snapshots();
  }

  getChatRooms(String userName) async {
    return await FirebaseFirestore.instance.collection("ChatRoom").where("users", arrayContains: userName).snapshots();
  }
  uploadPostInfo(Map<String, String> postMap) {
    FirebaseFirestore.instance.collection("Posts")
        .add(postMap).catchError((e) {
      print(e.toString());
    });
  }



}