import 'package:flutter/material.dart';
import 'package:geodata/ui/styles/ui_helpers.dart';

// Ordering of class parts
// class className {
//  fields;
//  getters/setters
//  constructor
//  methods/functions
// }

class Day extends StatelessWidget {

  final String text;
  final bool disabled;
  final bool selected;
  final bool header;

  Color get backgroundColor {
    if(selected) return UIHelper.hexToColor('#1462f8');
    return Colors.white;
  }

  Color get textColor {
    if(selected) return Colors.white;
    if(disabled) return UIHelper.hexToColor('#d9dde2');
    return UIHelper.hexToColor('#11151d');
  }

  EdgeInsets get margin {
    if(header) return EdgeInsets.only(left: 10, right: 10, bottom: 0);
    return EdgeInsets.all(3.0);
  }

  const Day({ 
    Key key,
    this.text,
    this.disabled = false,
    this.selected = false,
    this.header = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
      padding: EdgeInsets.all(4.0),
      margin: margin,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: this.backgroundColor,
        boxShadow: selected ? [
            new BoxShadow(
              color: Color.fromRGBO(20, 98, 248, 0.4),
              offset: new Offset(0, 0.2),
              blurRadius: 8.0,
            )
          ]: null,
      ),
      child: Container(
        height: 35.0,
        alignment: Alignment(0.0, 0.0),
        child: Text(text, style: TextStyle(
          fontSize: 16.0,
          fontWeight: header ? FontWeight.w600 : FontWeight.w500,
          color: this.textColor
        ))
      )
    )
    );
  }
}