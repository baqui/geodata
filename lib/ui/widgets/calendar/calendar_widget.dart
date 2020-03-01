import 'package:flutter/material.dart';
import './day.dart';
import './header.dart';
import './date_utils.dart';

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
  final DateTime selectedDate;
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
    this.selectedDate,
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

  DateTime viewStartDate; // first date for currently displayed view
  DateTime periodStartDate; // in week view equals to viewStartDate, in month view equals to first day of a month
  int rowsNumber; // different for week and month

  _CalendarState(DateTime initialDate, String displayPeriod) {
    // for week view this is initial date, 
    // for month view first day of the initial date month
    DateTime startingDate = displayPeriod == 'week' ? initialDate : DateTime.utc(initialDate.year, initialDate.month, 1);
    
    this.viewStartDate = DateUtils.calculateViewStartDate(startingDate);
    //startingDate.subtract(Duration(days: initialDate.weekday - 1 ));
    this.periodStartDate = startingDate;
    this.rowsNumber = displayPeriod == 'week' ? 1 : 6;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: <Widget>[
          Header(
            month: widget.monthLabels[periodStartDate.month - 1], 
            year: DateTime.utc(periodStartDate.year, 1, 1).year.toString(),
            onPrev: (){ handleViewChange("prev"); },
            onNext: (){ handleViewChange("next"); }
          ),
          Row(
            children: widget.dayLabels.map( (label) => 
              Day(text: label, header: true)
            ).toList()
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
              
              DateTime date = viewStartDate.add(Duration(days: (weekIndex * 7) + dayIndex));
              bool isDisabled = date.month != periodStartDate.month;
              bool selected = DateUtils.isSelected(widget.selectedDate, date);
              
              return Day(
                disabled: isDisabled,
                selected: selected,
                text: date.day.toString(),
                date: date,
                onDateSelected: widget.onDateSelected
              );
            })
          )),
      );
  }

  handleViewChange(String direction) {
    DateTime nextPeriodStartDate = DateUtils.calculatePeriodStartDate(direction, widget.displayPeriod, viewStartDate, periodStartDate);
    setState((){
      viewStartDate = DateUtils.calculateViewStartDate(nextPeriodStartDate);
      periodStartDate = nextPeriodStartDate;
    });
  }
}