import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:to_do/res/app_context_extension.dart';
import 'package:to_do/view/widgets/app_button.dart';

class AppCalender extends StatefulWidget {
  const AppCalender({Key? key}) : super(key: key);

  @override
  State<AppCalender> createState() => _AppCalenderState();
}

class _AppCalenderState extends State<AppCalender> {
  DateTime _currentDate = DateTime.now();
  DateTime? selectedDaytime;

  @override
  void initState() {
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double size = 350.0;
    debugPrint(selectedDaytime.toString());
    return Container(
      height: size + 63,
      width: size,
      color: context.resources.color.buttonBlue,
      child: Column(
        children: [
          CalendarCarousel<Event>(
            onDayPressed: (DateTime date, List<Event> events) {
              setState(() {
                _currentDate = date;
                // debugPrint(_currentDate.toString());
                // selectedDaytime = _currentDate;
              });
            },
            weekendTextStyle: const TextStyle(
              color: Colors.red,
            ),
            thisMonthDayBorderColor: Colors.grey,

            weekFormat: false,
            weekdayTextStyle: TextStyle(
              fontSize: 18,
              color: context.resources.color.colorWhite,
            ),
            headerTextStyle: TextStyle(
              fontSize: 18,
              color: context.resources.color.colorWhite,
            ),
            iconColor: Colors.white,
            // markedDatesMap: _markedDateMap,
            // height: 340.0,
            height: size,
            width: size,
            scrollDirection: Axis.horizontal,
            selectedDateTime: _currentDate,
            selectedDayButtonColor: context.resources.color.blueAppColor,
            prevDaysTextStyle: TextStyle(
              fontSize: 16,
              color: context.resources.color.colorWhite,
            ),
            daysHaveCircularBorder: false,
            nextDaysTextStyle: TextStyle(
              fontSize: 16,
              color: context.resources.color.colorWhite,
            ),
            daysTextStyle: TextStyle(
              fontSize: 16,
              color: context.resources.color.colorWhite,
            ),

            /// null for not rendering any border, true for circular border, false for rectangular border
          ),
          Row(
            children: [
              // Expanded(
              //   child: OutlinedButton(
              //     child: Text('Cancel',
              //         style: TextStyle(
              //             color: context.resources.color.blueAppColor)),
              //     onPressed: () {
              //       // setState(() {
              //       //   _targetDateTime = DateTime(
              //       //       _targetDateTime.year, _targetDateTime.month - 1);
              //       //   _currentMonth =
              //       //       DateFormat.yMMM().format(_targetDateTime);
              //       // });
              //     },
              //   ),
              // ),
              AppButton(
                text: 'Cancel',
                useSecondColor: false,
                onPressed: () => Navigator.pop(context),
              ),
              const AppButton(
                text: 'Choose Time',
                useSecondColor: true,
              ),
            ],
          ),
        ],
      ),
    );
  }


}

Container appCalendar(
    {required BuildContext context,
    Function(DateTime, List<Event>)? onDayPressed,
    DateTime? selectedDateTime}) {
  double size = 350.0;
  DateTime _currentDate = DateTime.now();
  return Container(
    height: size + 63,
    width: size,
    color: context.resources.color.buttonBlue,
    // margin: EdgeInsets.only(right: padding, left: padding),
    // padding: const EdgeInsets.only(left: 10.0, right: 10.0),
    child: Column(
      children: [
        CalendarCarousel<Event>(
          onDayPressed: onDayPressed,
          weekendTextStyle: const TextStyle(
            color: Colors.red,
          ),
          thisMonthDayBorderColor: Colors.grey,
//      weekDays: null, /// for pass null when you do not want to render weekDays
//      headerText: Container( /// Example for rendering custom header
//        child: Text('Custom Header'),
//      ),
          // customDayBuilder: (
          //   /// you can provide your own build function to make custom day containers
          //   bool isSelectable,
          //   int index,
          //   bool isSelectedDay,
          //   bool isToday,
          //   bool isPrevMonthDay,
          //   TextStyle textStyle,
          //   bool isNextMonthDay,
          //   bool isThisMonthDay,
          //   DateTime day,
          // ) {
          //   /// If you return null, [CalendarCarousel] will build container for current [day] with default function.
          //   /// This way you can build custom containers for specific days only, leaving rest as default.

          //   // Example: every 15th of month, we have a flight, we can place an icon in the container like that:
          //   if (day.day == 15) {
          //     return const Center(
          //       child: Icon(Icons.local_airport),
          //     );
          //   } else {
          //     return null;
          //   }
          // },
          weekFormat: false,
          weekdayTextStyle: TextStyle(
            fontSize: 18,
            color: context.resources.color.colorWhite,
          ),
          headerTextStyle: TextStyle(
            fontSize: 18,
            color: context.resources.color.colorWhite,
          ),
          iconColor: Colors.white,
          // markedDatesMap: _markedDateMap,
          // height: 340.0,
          height: size,
          width: size,
          scrollDirection: Axis.horizontal,
          selectedDateTime: selectedDateTime,
          selectedDayButtonColor: context.resources.color.blueAppColor,
          prevDaysTextStyle: TextStyle(
            fontSize: 16,
            color: context.resources.color.colorWhite,
          ),
          daysHaveCircularBorder: false,
          nextDaysTextStyle: TextStyle(
            fontSize: 16,
            color: context.resources.color.colorWhite,
          ),
          daysTextStyle: TextStyle(
            fontSize: 16,
            color: context.resources.color.colorWhite,
          ),

          /// null for not rendering any border, true for circular border, false for rectangular border
        ),
        Row(
          children: const [
            // Expanded(
            //   child: OutlinedButton(
            //     child: Text('Cancel',
            //         style: TextStyle(
            //             color: context.resources.color.blueAppColor)),
            //     onPressed: () {
            //       // setState(() {
            //       //   _targetDateTime = DateTime(
            //       //       _targetDateTime.year, _targetDateTime.month - 1);
            //       //   _currentMonth =
            //       //       DateFormat.yMMM().format(_targetDateTime);
            //       // });
            //     },
            //   ),
            // ),
            AppButton(
              text: 'Cancel',
              useSecondColor: false,
            ),
            AppButton(
              text: 'Choose Time',
              useSecondColor: true,
            ),
          ],
        ),
      ],
    ),
  );
}
