import 'package:flutter/material.dart';
import 'package:geodata/ui/styles/ui_helpers.dart';

// Ordering of class parts
// class className {
//  fields;
//  getters/setters
//  constructor
//  methods/functions
// }

class Header extends StatelessWidget {

  final String year;
  final String month;

  const Header({ 
    Key key,
    this.year,
    this.month
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 10, bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(month, style: TextStyle(
                fontSize: 22.0,
                color: UIHelper.hexToColor('#11151d'),
                fontWeight: FontWeight.w800
              )),
              SizedBox(width: 8),
              Text(year, style: TextStyle(
                fontSize: 22.0,
                color: UIHelper.hexToColor('#11151d'),
                fontWeight: FontWeight.w300
              ))
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 20),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: UIHelper.hexToColor('#11151d'),
                    size: 22.0
                  ),
                )
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: UIHelper.hexToColor('#11151d'),
                    size: 22.0
                  ),
                )
              ),
            ],
          )
        ],
      ),
    );
  }
}