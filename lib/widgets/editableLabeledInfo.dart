import 'package:flutter/material.dart';
import 'package:access_granted/helper/constants.dart';
class EditableLabeledInfo extends StatelessWidget{
  final String label, info;
  final double infoFontSize;
  final bool editable;
  final Function handleChange;
  EditableLabeledInfo({this.label, this.info, this.infoFontSize = 24.0, this.editable, this.handleChange});

  @override
  Widget build(BuildContext context) {
    return Row(
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
                this.editable ?
                TextFormField(
                  initialValue: this.info,
                  validator: (val){
                    return val.isEmpty ? "Invalid input." : null;
                  },
                  onChanged: this.handleChange,
                  style: TextStyle(
                    color: Color(Constants.colors['white']),
                  ),
                ) : Text(
                  this.info,
                  style: TextStyle(
                    fontSize: this.infoFontSize,
                    color: Color(Constants.colors['white']),
                  ),
                )
                ,
              ],
            ),
          ),
        )
      ],
    );
  }

}