import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart' show DateFormat;
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
  final DateTime _currentDate2 = DateTime(2019, 2, 3);
  final String _currentMonth = DateFormat.yMMM().format(DateTime(2019, 2, 3));
  final DateTime _targetDateTime = DateTime(2019, 2, 3);
//  List<DateTime> _markedDate = [DateTime(2018, 9, 20), DateTime(2018, 10, 11)];
  static final Widget _eventIcon = Container(
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(1000)),
        border: Border.all(color: Colors.blue, width: 2.0)),
    child: const Icon(
      Icons.person,
      color: Colors.amber,
    ),
  );

  // final EventList<Event> _markedDateMap = EventList<Event>(
  //   events: {
  //     DateTime(2019, 2, 10): [
  //       Event(
  //         date: DateTime(2019, 2, 10),
  //         title: 'Event 1',
  //         icon: _eventIcon,
  //         dot: Container(
  //           margin: const EdgeInsets.symmetric(horizontal: 1.0),
  //           color: Colors.red,
  //           height: 5.0,
  //           width: 5.0,
  //         ),
  //       ),
  //       Event(
  //         date: DateTime(2019, 2, 10),
  //         title: 'Event 2',
  //         icon: _eventIcon,
  //       ),
  //       Event(
  //         date: DateTime(2019, 2, 10),
  //         title: 'Event 3',
  //         icon: _eventIcon,
  //       ),
  //     ],
  //   },
  // );

  @override
  void initState() {
    /// Add more events to _markedDateMap EventList
    // _markedDateMap.add(
    //     DateTime(2019, 2, 25),
    //     Event(
    //       date: DateTime(2019, 2, 25),
    //       title: 'Event 5',
    //       icon: _eventIcon,
    //     ));

    // _markedDateMap.add(
    //     DateTime(2019, 2, 10),
    //     Event(
    //       date: DateTime(2019, 2, 10),
    //       title: 'Event 4',
    //       icon: _eventIcon,
    //     ));

    // _markedDateMap.addAll(DateTime(2019, 2, 11), [
    //   Event(
    //     date: DateTime(2019, 2, 11),
    //     title: 'Event 1',
    //     icon: _eventIcon,
    //   ),
    //   Event(
    //     date: DateTime(2019, 2, 11),
    //     title: 'Event 2',
    //     icon: _eventIcon,
    //   ),
    //   Event(
    //     date: DateTime(2019, 2, 11),
    //     title: 'Event 3',
    //     icon: _eventIcon,
    //   ),
    // ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    double size = 350.0;

    return Container(
      height: size + 63,
      width: size,
      color: context.resources.color.buttonBlue,
      // margin: EdgeInsets.only(right: padding, left: padding),
      // padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: Column(
        children: [
          CalendarCarousel<Event>(
            onDayPressed: (DateTime date, List<Event> events) {
              setState(() => _currentDate = date);
            },
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
}
