import 'package:flutter/material.dart';

import 'package:geodata/ui/styles/ui_helpers.dart';
import 'package:geodata/ui/widgets/popup_menu_button.dart';
import 'package:geodata/ui/widgets/information_bar.dart';

class ModalBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.close, size: 30.0),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Text('Request details',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18.0,
                          color: UIHelper.hexToColor('#11151d'),
                          letterSpacing: 0.3)),
                  CustomPopupMenuButton()
                ],
              ),
              SizedBox(height: 25.0),
              InformationBar(text: 'Request has been accepted')
            ],
          ),
        ));
  }
}
