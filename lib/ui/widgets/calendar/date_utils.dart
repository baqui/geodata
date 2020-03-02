class DateUtils {
  static bool isSelected(DateTime selectedDate, DateTime date) {
    return date.difference(selectedDate).inDays == 0 &&
        date.day == selectedDate.day &&
        date.year == selectedDate.year;
  }

  static DateTime calculatePeriodStartDate(String direction,
      String displayPeriod, DateTime viewStartDate, DateTime periodStartDate) {
    // TODO: write tests for this function

    int factor = direction == 'next' ? 1 : -1;
    bool isYearChange = (periodStartDate.month + factor) > 12 ||
        (periodStartDate.month + factor) < 1;
    int year =
        isYearChange ? periodStartDate.year + factor : periodStartDate.year;
    int month = isYearChange
        ? (direction == 'next' ? 1 : 12)
        : periodStartDate.month + factor;

    DateTime weekViewNextPeriodDate = direction == 'next'
        ? viewStartDate.add(Duration(days: 7))
        : viewStartDate.subtract(Duration(days: 7));
    DateTime monthViewNextPeriodDate = DateTime.utc(year, month, 1);

    return displayPeriod == 'week'
        ? weekViewNextPeriodDate
        : monthViewNextPeriodDate;
  }

  static DateTime calculateViewStartDate(DateTime periodStartDate) {
    return periodStartDate
        .subtract(Duration(days: periodStartDate.weekday - 1));
  }
}
