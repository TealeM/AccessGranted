import 'package:flutter/material.dart';
import 'package:access_granted/helper/constants.dart';
class LabeledInfo extends StatelessWidget{
  final String label, info;
  final double infoFontSize;

  LabeledInfo({this.label, this.info, this.infoFontSize = 24.0});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){

      },
      child: Row(
        children: [
          Flexible(
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    this.label.toUpperCase(),
                    style: TextStyle(
                        fontSize: 15.0,
                        color: Color(Constants.colors['green'])
                    ),
                  ),
                  SizedBox(height:5.0),
                  Text(
                    this.info,
                    style: TextStyle(
                        fontSize: this.infoFontSize,
                        color: Color(Constants.colors['white']),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

}