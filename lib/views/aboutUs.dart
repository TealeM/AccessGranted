import 'package:access_granted/helper/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("About Us")
        ),

        body: SingleChildScrollView(
          child: Scrollbar(
            child: Column(
            children: [
              Container (
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 140),
                  color: Color(0xFF1EA699),
                  child: Text ('OUR STORY', style: TextStyle(fontSize: 24))
                )
              ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                  child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 24)
                  )
                ),
                Container (
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Container(
                        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 111),
                        color: Color(0xFF1EA699),
                        child: Text ('MEET THE TEAM', style: TextStyle(fontSize: 24))
                    )
                ),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
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