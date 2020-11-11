import 'package:access_granted/helper/authenticate.dart';
import 'package:access_granted/helper/constants.dart';
import 'package:access_granted/helper/drawer.dart';
import 'package:access_granted/helper/helperfunctions.dart';
import 'package:access_granted/services/auth.dart';
import 'package:access_granted/views/search.dart';
import 'package:access_granted/views/chatRoomsScreen.dart';
import 'package:access_granted/views/userProfile.dart';
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
      appBar: AppBar(
        title: Text("Welcome to Access Granted!"),
      ),
      body: SingleChildScrollView(
        child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            height: MediaQuery.of(context).size.height-380,
            alignment: Alignment.center,
              child: Scrollbar(
                child: GridView.count(
                  scrollDirection: Axis.vertical,
                  crossAxisCount: 2 ,
                  children: List.generate(6,(index){
                    return Container(
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 55),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),  color: Colors.amber,),
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
          Container(
            padding: EdgeInsets.symmetric(vertical: 50),
            child: Column(
              children: [
                Container(
                  color: Colors.blueGrey,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Text('We should celebrate neurodiversity. The world would be poorer and life duller if we were all the same.',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontStyle: FontStyle.italic
                  )
              )),
                Container(
                  alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Text ('- Neil Milliken',
                  style: TextStyle(color: Colors.white, fontSize: 24)
                ))
            ]),
          ),
        ]),
      ),
        drawer: MyDrawer ()
      );
  }
}