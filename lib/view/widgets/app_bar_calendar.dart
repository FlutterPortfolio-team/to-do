import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:to_do/res/app_context_extension.dart';

class AppBarCalendar extends StatefulWidget {
  const AppBarCalendar({Key? key}) : super(key: key);

  @override
  State<AppBarCalendar> createState() => _AppBarCalendarState();
}

class _AppBarCalendarState extends State<AppBarCalendar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.resources.color.buttonBlue,
      height: 150.0,
      // color: Color(0xFF0E2045),
      child: CalendarCarousel<Event>(
        // onDayPressed: (date, events) {
        //   this.setState(() => _currentDate = date);
        //   events.forEach((event) => print(event.title));
        // },
        weekendTextStyle: const TextStyle(
          color: Colors.red,
        ),
        weekdayTextStyle: TextStyle(
          fontSize: 16,
          color: context.resources.color.colorWhite,
        ),
        thisMonthDayBorderColor: Colors.grey,
//          weekDays: null, /// for pass null when you do not want to render weekDays
        // headerText: 'Custom Header',
        weekFormat: true,
        // markedDatesMap: _markedDateMap,
        height: 200.0,
        // selectedDateTime: _currentDate2,
        showIconBehindDayText: true,
//          daysHaveCircularBorder: false, /// null for not rendering any border, true for circular border, false for rectangular border
        customGridViewPhysics: NeverScrollableScrollPhysics(),
        markedDateShowIcon: true,
        markedDateIconMaxShown: 2,
        selectedDayTextStyle: TextStyle(
          color: Colors.yellow,
        ),
        selectedDayButtonColor: context.resources.color.blueAppColor,
        todayTextStyle: TextStyle(
          color: Colors.blue,
        ),
        // markedDateIconBuilder: (event) {
        //   return event.icon ?? Icon(Icons.help_outline);
        // },
        // minSelectedDate: _currentDate.subtract(Duration(days: 360)),
        // maxSelectedDate: _currentDate.add(Duration(days: 360)),
        headerTextStyle: TextStyle(
          fontSize: 18,
          color: context.resources.color.colorWhite,
        ),
        iconColor: Colors.white,
        todayButtonColor: context.resources.color.buttonBlue,
        todayBorderColor: Colors.green,
        daysHaveCircularBorder: false,
        daysTextStyle: TextStyle(
          fontSize: 16,
          color: context.resources.color.colorWhite,
        ),
        nextDaysTextStyle: TextStyle(
          fontSize: 16,
          color: context.resources.color.colorWhite,
        ),
        prevDaysTextStyle: TextStyle(
          fontSize: 16,
          color: context.resources.color.colorWhite,
        ),
        markedDateMoreShowTotal:
            true, // null for not showing hidden events indicator
//          markedDateIconMargin: 9,
//          markedDateIconOffset: 3,
      ),
    );
  }
}
