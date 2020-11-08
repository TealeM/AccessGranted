import 'package:access_granted/helper/authenticate.dart';
import 'package:access_granted/helper/constants.dart';
import 'package:access_granted/helper/helperfunctions.dart';
import 'package:access_granted/services/auth.dart';
import 'package:access_granted/views/search.dart';
import 'package:access_granted/views/chatRoomsScreen.dart';
import 'package:access_granted/widgets/widget.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height-200,
          alignment: Alignment.center,
          child: Container(
            height: 400,
            child: GridView.count(
              scrollDirection: Axis.vertical,
              crossAxisCount: 2 ,
              children: List.generate(4,(index){
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 55),
                    color: Colors.amber,
                    child: Text ('Accessible Gaming News!',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                          ),
                      textAlign: TextAlign.center,
                    ),
                  )
                );
              }),
            ),
          ),
        ),
      ),
      drawer: Container(
        width : 200,
        height : 800,
        padding: EdgeInsets.only(top: 40),
        child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              title: Text('My Profile'),
              onTap: () {

                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Postings'),
              onTap: () {

                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Messages'),
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) => ChatRoomScreen()
                ));
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('About Us'),
              onTap: () {

                Navigator.pop(context);
              },
            ),
          ],
        )
      ),
      ),
    );
  }
}