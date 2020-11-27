import 'package:access_granted/helper/authenticate.dart';
import 'package:access_granted/helper/constants.dart';
import 'package:access_granted/helper/drawer.dart';
import 'package:access_granted/helper/helperfunctions.dart';
import 'package:access_granted/services/auth.dart';
import 'package:access_granted/services/database.dart';
import 'package:access_granted/views/conversationScreen.dart';
import 'package:access_granted/views/search.dart';
import 'package:access_granted/widgets/widget.dart';
import 'package:flutter/material.dart';

class ChatRoomScreen extends StatefulWidget {
  @override
  _ChatRoomScreenState createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> {

  AuthMethods authMethods = new AuthMethods();
  DatabaseMethods databaseMethods = new DatabaseMethods();

  Stream chatRoomsStream;

  Widget chatRoomList() {
    return StreamBuilder(
      stream:  chatRoomsStream,
      builder: (context, snapshot) {
        return snapshot.hasData ? ListView.builder(
          itemCount: snapshot.data.documents.length,
          shrinkWrap: true,
          itemBuilder: (context, index){
            return ChatRoomTile(
              snapshot.data.docs[index].data()['chatroomId']
                  .toString()
                  .replaceAll("_", "")
                  .replaceAll(Constants.myName, ""),
              snapshot.data.docs[index].data()["chatroomId"],
            );
          }) : Container();
      },
    );
  }

  @override
  void initState() {
    getUserInfo();
    super.initState();
  }

  getUserInfo() async {
    Constants.myName = await HelperFunctions.getUserNameSharedPreference();
    databaseMethods.getChatRooms(Constants.myName).then((value){
      setState(() {
        chatRoomsStream = value;
      });
    });
    //print("your username is " + Constants.myName.toString());
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: Container(
        child: chatRoomList(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => SearchScreen()
          ));
        },
      ),
      drawer: MyDrawer ()
    );
  }
}


class ChatRoomTile extends StatelessWidget {
  final String userName;
  final String chatRoomId;
  ChatRoomTile(this.userName, this.chatRoomId);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
       Navigator.push(context, MaterialPageRoute(
         builder: (context) => ConversationScreen(chatRoomId)
       ));
      },
      child: Container(
        color: Colors.black26,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Row(
          children: [
            Container(
              height: 40,
              width: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Text("${userName.substring(0,1).toUpperCase()}", style: mediumTextStyle(),)
            ),
            SizedBox(width: 8,),
            Text(userName, style: mediumTextStyle(),)
          ],
        ),
      ),
    );
  }
}
