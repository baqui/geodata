//import 'package:calendar_strip/calendar_strip.dart';
import 'package:flutter/material.dart';
import 'package:geodata/ui/styles/ui_helpers.dart';
import 'package:geodata/ui/widgets/calendar/calendar_widget.dart' as custom;

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            UIHelper.verticalSpace(80),
            new custom.Calendar(
              initialDate: DateTime.now(),
              displayPeriod: "month",
              selectedDate: selectedDate,
              onDateSelected: (DateTime date) {
                setState(() {
                  selectedDate = date;
                });
              },
            ),
            UIHelper.verticalSpace(80),
          ],
        ));
  }
}
