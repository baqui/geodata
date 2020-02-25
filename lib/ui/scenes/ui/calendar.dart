//import 'package:calendar_strip/calendar_strip.dart';
import 'package:flutter/material.dart';
import 'package:geodata/ui/styles/ui_helpers.dart';
import 'package:geodata/ui/widgets/calendar/calendar_widget.dart' as custom;

class Calendar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          UIHelper.verticalSpace(80),
          custom.Calendar(
            initialDate: DateTime.now(),
            onDateSelected: (){ print('onDateSelected'); },
          ),
          UIHelper.verticalSpace(80),
          // Container(
          //   child: CalendarStrip(
          //   startDate: DateTime.now(),
          //   endDate: DateTime.now().add(Duration(days: 10)),
          //   onDateSelected: (){},
          //   //dateTileBuilder: dateTileBuilder,
          //   iconColor: UIHelper.hexToColor('#1462f8'),
          //   //monthNameWidget: _monthNameWidget,
          //   //markedDates: markedDates,
          //   containerDecoration: BoxDecoration(color: Colors.black12),
          // )
          //),
        ],
      ));
  }
}