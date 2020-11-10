import 'package:flutter/material.dart';
import 'package:access_granted/helper/constants.dart';

class IconNumberCard extends StatelessWidget{
  final IconData icon;
  final String number;
  final String description;
  final Function handleClick;

  IconNumberCard({this.icon = Icons.info, this.number, this.description, this.handleClick});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(Constants.colors['green']),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(5.0),
        onTap: (){
          this.handleClick();
        },
        child: Container(
          width: 106,
          height: 58,
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    child: Icon(
                      this.icon,
                      size: 19,
                      color: Color(Constants.colors['darkGreen']),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  SizedBox(height: 12),
                  Container(
                    width: 106,
                    child: Text(
                      this.number,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 19.0
                      ),
                    ),
                  ),
                  Container(
                    width: 106,
                    child: Text(
                      this.description,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 9
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

}