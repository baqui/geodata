import 'package:flutter/material.dart';
import 'package:geodata/ui/styles/ui_helpers.dart';
import './day.dart';
import './header.dart';

// Ordering of class parts
// class className {
//  fields;
//  getters/setters
//  constructor
//  methods/functions
// }

class Calendar extends StatefulWidget {
  final DateTime minDate;
  final DateTime maxDate;
  final DateTime initialDate;
  final List<int> disabledDaysOfWeek; //1-7
  final List<DateTime> disabledDays;
  final Function onDateSelected;
  final Function onViewStartDateChanged;
  final String displayPeriod; // week / month
  final List<String> monthLabels = [
    "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
  final List<String> dayLabels = ["Mo", "Tu", "We", "Th", "Fr", "Sa", "Su"];

  Calendar({
    this.minDate,
    this.maxDate,
    @required this.initialDate,
    this.disabledDaysOfWeek,
    this.disabledDays,
    @required this.onDateSelected,
    this.onViewStartDateChanged,
    this.displayPeriod = 'week'
  });

  @override
  _CalendarState createState() => _CalendarState(initialDate, displayPeriod);
}

class _CalendarState extends State<Calendar> {

  DateTime viewStartDate; //first date for currently displayed view
  int rowsNumber; //different for week and month

  _CalendarState(DateTime initialDate, String displayPeriod) {
    this.viewStartDate = initialDate.subtract(Duration(days: initialDate.weekday - 1 )); //days are indexed from 1
    this.rowsNumber = displayPeriod == 'week' ? 1 : 5;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: <Widget>[
          Header(month: 'January', year: '2019'),
          Row(
            children: widget.dayLabels.map( (label) => Day(text: label, header: true)).toList()
          ),
          buildDatesRow()
        ],
      )
    );
  }

  Widget buildDatesRow() {
    return Column(
        children: List<Widget>.generate(rowsNumber, (weekIndex) => Row( // 1 or 5 - weeks number
            children: List<Widget>.generate(7, (dayIndex) { // 7 - n days of the week 
              return Day(text: '01');
            })
          )),
      );
  }
}