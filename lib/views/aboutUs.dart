import 'package:access_granted/helper/drawer.dart';
import 'package:access_granted/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarMain(context),

        body: SingleChildScrollView(
          child: Scrollbar(
            child: Column(
            children: [
              Container (
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Container(
                  width: 400,
                  height: 40,
                  //padding: EdgeInsets.symmetric(vertical: 5, horizontal: 100),
                  color: Color(0xFF1EA699),
                  child: Center(
                      child: Text ('OUR MISSION', style: TextStyle(fontSize: 24, color: Colors.white))
                  ),
                )
              ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child:
                  Text('Access Granted was founded by six university students who believe in equal and authentic representation within games. The team hopes for Access Granted to be a community hub for both developers and marginalized gamers to speak to each other, and be heard by one another. Above all, the team created Access Granted to provide a space for marginalized individuals to have a voice within the vast gaming industry.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 24)
                  ),
                ),
              Container (
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Container(
                    width: 400,
                    height: 40,
                    //padding: EdgeInsets.symmetric(vertical: 5, horizontal: 100),
                    color: Color(0xFF1EA699),
                    child: Center(
                        child: Text ('THE TEAM', style: TextStyle(fontSize: 24, color: Colors.white))
                    ),
                  )
              ),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 20),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 70
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 20),
                                child: Text('Taylor Skaalrud', style: TextStyle(color: Colors.white, fontSize: 24)
                                )
                              ),
                            ]),
                          ),
                        Container(
                          padding: EdgeInsets.only(top: 20),
                          child: Row(
                              children: [
                                CircleAvatar(
                                    radius: 70
                                ),
                                Container(
                                    padding: EdgeInsets.only(left: 20),
                                    child: Text('Brianna Tipping', style: TextStyle(color: Colors.white, fontSize: 24)
                                    )
                                ),
                              ]),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 20),
                          child: Row(
                              children: [
                                CircleAvatar(
                                    radius: 70
                                ),
                                Container(
                                    padding: EdgeInsets.only(left: 20),
                                    child: Text('Teale Masrani', style: TextStyle(color: Colors.white, fontSize: 24)
                                    )
                                ),
                              ]),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 20),
                          child: Row(
                              children: [
                                CircleAvatar(
                                    radius: 70
                                ),
                                Container(
                                    padding: EdgeInsets.only(left: 20),
                                    child: Text('Derek Alenius', style: TextStyle(color: Colors.white, fontSize: 24)
                                    )
                                ),
                              ]),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 20),
                          child: Row(
                              children: [
                                CircleAvatar(
                                    radius: 70
                                ),
                                Container(
                                    padding: EdgeInsets.only(left: 20),
                                    child: Text('Kailen Pocsai', style: TextStyle(color: Colors.white, fontSize: 24)
                                    )
                                ),
                              ]),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 20),
                          child: Row(
                              children: [
                                CircleAvatar(
                                    radius: 70
                                ),
                                Container(
                                    padding: EdgeInsets.only(left: 20),
                                    child: Text('James Aberefa', style: TextStyle(color: Colors.white, fontSize: 24)
                                    )
                                ),
                              ]),
                        )
                    ])
                ),
            ]),
          ),
        ),
        drawer: MyDrawer()
      );
    }
}