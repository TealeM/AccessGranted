import 'package:access_granted/helper/constants.dart';
import 'package:access_granted/helper/drawer.dart';
import 'package:access_granted/helper/helperfunctions.dart';
import 'package:access_granted/services/database.dart';
import 'package:access_granted/views/conversationScreen.dart';
import 'package:access_granted/widgets/widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  DatabaseMethods databaseMethods = new DatabaseMethods();
  TextEditingController searchTextEditingController = new TextEditingController();

  String _myName;
  String opponentUserType;

  Widget searchList(){
    if (opponentUserType == "developer") {
      return searchSnapshot != null ? ListView.builder(
          itemCount: searchSnapshot.docs.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return postTile(
                title: searchSnapshot.docs[index].data()["title"],
                gameDesc: searchSnapshot.docs[index].data()["gamedesc"],
                consultationDesc: searchSnapshot.docs[index].data()["consdesc"],
                devName: searchSnapshot.docs[index].data()["devname"]
            );
          }) : Container();
    } else if (opponentUserType == "community") {
      return searchSnapshot != null ? ListView.builder(
          itemCount: searchSnapshot.docs.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return SearchTile(
              userName: searchSnapshot.docs[index].data()["name"],
              userEmail: searchSnapshot.docs[index].data()["email"],
            );
          }) : Container();
    } else {
      return Container();
    }
  }

  QuerySnapshot searchSnapshot;

  initiateSearch() async {
    databaseMethods.doSearch(searchTextEditingController.text)
        .then((val){
          setState(() {
            searchSnapshot = val;
            print(searchSnapshot.docs[0].data());
          });
    });
    Map opponents = {
      Constants.COMMUNITY_USER : Constants.DEV_USER,
      Constants.DEV_USER : Constants.COMMUNITY_USER
    };
    await HelperFunctions.getUserTypeSharedPreference().then((_userType) {
      if(_userType != null){
        opponentUserType = opponents[_userType];
      }
    });
  }

  /// create chatroom, send user to conversation screen, pushreplacement
  createChatroomAndStartConversation(String userName){

    //if(userName != Constants.myName) {
    print(Constants.myName);
      String chatRoomId = getChatRoomId(userName, Constants.myName);

      List<String> users = [userName, Constants.myName];
      Map<String, dynamic> chatRoomMap = {
        "users" : users,
        "chatroomId" : chatRoomId
      };

      DatabaseMethods().createChatRoom(chatRoomId, chatRoomMap);
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => ConversationScreen(
            chatRoomId
          )
      ));
    //} else {
    //  print("You cannot send messages to yourself");
   // }

  }

  Widget SearchTile({String userName, String userEmail}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(userName, style: simpleTextStyle(),),
              Text(userEmail, style: simpleTextStyle(),)
            ],
          ),
          Spacer(),
          GestureDetector(
            onTap: (){
              createChatroomAndStartConversation(userName);
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(30)
              ),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Text("Message", style: mediumTextStyle()),
            ),
          )
        ],
      ),
    );
  }

  Widget postTile({String title, String gameDesc, String consultationDesc, String devName}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Wrap(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title+"\n", style: boldTextStyle(),),
              Text(gameDesc+"\n", style: simpleTextStyle(),),
              Text(consultationDesc+"\n", style: simpleTextStyle(),)
            ],
          ),
          Spacer(),
          GestureDetector(
            onTap: (){
              createChatroomAndStartConversation(devName);
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(30)
              ),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Text("Message", style: mediumTextStyle()),
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: Container(
        child: Column(
          children: [
            Container(
              color: Color(0x54FFFFFF),
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                        controller: searchTextEditingController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: "search...",
                          hintStyle: TextStyle(
                            color: Colors.white54
                          ),
                          border: InputBorder.none
                        ),

                      )
                  ),
                  GestureDetector(
                    onTap: (){
                      initiateSearch();
                      databaseMethods.doSearch(searchTextEditingController.text).then((val){
                        print(val.toString());
                      });
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              const Color(0x36FFFFFF),
                              const Color(0x0FFFFFFFF)
                            ]
                          ),
                              borderRadius: BorderRadius.circular(40)
                        ),
                        padding: EdgeInsets.all(12),
                        child: Image.asset("assets/images/search_white.png")),
                  )
                ],
              ),
            ),
            searchList()
          ],
        ),
      ),
      drawer: MyDrawer ()
    );
  }
}


getChatRoomId(String a, String b) {
  print(a);
  print(b);
  if (a.substring(0,1).codeUnitAt(0) > b.substring(0,1).codeUnitAt(0)) {
    return "$b\_$a";
  } else {
    return "$a\_$b";
  }
}