import 'package:flutter/material.dart';
import 'package:geodata/ui/styles/ui_helpers.dart';

class InformationBar extends StatelessWidget {
  final String text;
  InformationBar({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      //height: 72,
      decoration: BoxDecoration(
          color: Color.fromRGBO(54, 222, 155, 0.15),
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: Padding(
          padding: EdgeInsets.only(left: 15, top: 20, right: 15, bottom: 20),
          child: Row(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: UIHelper.hexToColor('#36de9b'),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Icon(Icons.done, color: Colors.white, size: 25.0),
                  )),
              Flexible(
                child: Text(text,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 17.0,
                        color: UIHelper.hexToColor('#11151d'),
                        letterSpacing: 0.3)),
              )
            ],
          )),
    );
  }
}
