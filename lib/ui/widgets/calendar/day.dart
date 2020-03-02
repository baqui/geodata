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
  final DateTime date;
  final String text;
  final bool disabled;
  final bool selected;
  final bool header;
  final Function onDateSelected;

  Color get backgroundColor {
    if (selected) return UIHelper.hexToColor('#1462f8');
    return Colors.white;
  }

  Color get textColor {
    if (selected) return Colors.white;
    if (disabled) return UIHelper.hexToColor('#d9dde2');
    return UIHelper.hexToColor('#11151d');
  }

  EdgeInsets get margin {
    if (header) return EdgeInsets.only(left: 10, right: 10, bottom: 0);
    return EdgeInsets.all(3.0);
  }

  const Day(
      {Key key,
      this.date,
      this.text,
      this.disabled = false,
      this.selected = false,
      this.header = false,
      this.onDateSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: InkWell(
      onTap: header
          ? null
          : () {
              onDateSelected(date);
            },
      customBorder: CircleBorder(),
      splashColor: Colors.greenAccent,
      child: Container(
          padding: EdgeInsets.only(top: 4.0, bottom: 4.0),
          margin: margin,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: this.backgroundColor,
            boxShadow: selected
                ? [
                    new BoxShadow(
                      color: Color.fromRGBO(20, 98, 248, 0.4),
                      offset: new Offset(0, 0.2),
                      blurRadius: 8.0,
                    )
                  ]
                : null,
          ),
          child: Container(
              height: 35.0,
              alignment: Alignment(0.0, 0.0),
              child: Text(text,
                  softWrap: false,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: header ? FontWeight.w600 : FontWeight.w500,
                    color: this.textColor,
                  )))),
    ));
  }
}
