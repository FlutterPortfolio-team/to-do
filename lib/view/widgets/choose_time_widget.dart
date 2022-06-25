import 'package:flutter/material.dart';
import 'package:to_do/view/widgets/pop_up_container.dart';
import 'package:to_do/view/widgets/small_container.dart';
import 'package:wheel_chooser/wheel_chooser.dart';

class ChooseTimeWidget extends StatelessWidget {
  final Function(dynamic) onMinutesValueChanged;
  final Function(dynamic) onHourValueChanged;
  final Function(dynamic) onTimeValueChanged;
  final Function()? onSaved;

  ChooseTimeWidget({
    Key? key,
    required this.onMinutesValueChanged,
    required this.onHourValueChanged,
    required this.onTimeValueChanged,
    this.onSaved,
  }) : super(key: key);
  final minute = [
    '01',
    '02',
    '03',
    '04',
    '05',
    '06',
    '07',
    '08',
    '09',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '2',
    '23',
    '24',
    '25',
    '26',
    '27',
    '28',
    '29',
    '30',
    '31',
    '32',
    '33',
    '34',
    '35',
    '36',
    '37',
    '38',
    '39',
    '40',
    '41',
    '42',
    '43',
    '44',
    '45',
    '46',
    '47',
    '48',
    '49',
    '50',
    '51',
    '52',
    '53',
    '54',
    '55',
    '56',
    '57',
    '58',
    '59',
    '60'
  ];
  final hour = [
    '01',
    '02',
    '03',
    '04',
    '05',
    '06',
    '07',
    '08',
    '09',
    '10',
    '11',
    '12',
  ];
  final time = ['PM', 'AM'];
  @override
  Widget build(BuildContext context) {
    var hourWheel = WheelChooser(
      onValueChanged: onHourValueChanged,
      datas: minute,
      startPosition: 5,
      selectTextStyle: const TextStyle(fontSize: 20, color: Colors.white),
      unSelectTextStyle: const TextStyle(fontSize: 20, color: Colors.grey),
    );
    var minutesWheel = WheelChooser(
      onValueChanged: onMinutesValueChanged,
      datas: minute,
      startPosition: 29,
      selectTextStyle: const TextStyle(fontSize: 20, color: Colors.white),
      unSelectTextStyle: const TextStyle(fontSize: 20, color: Colors.grey),
    );
    var timeWheel = WheelChooser(
      onValueChanged: onTimeValueChanged,
      datas: time,
      selectTextStyle: const TextStyle(fontSize: 20, color: Colors.white),
      unSelectTextStyle: const TextStyle(fontSize: 20, color: Colors.grey),
    );
    return PopUpContainer(
        setTodefault: true,
        height: 270,
        title: 'Choose Time',
        button2Title: 'Save',
        button1Pressed: () => Navigator.pop(context),
        button2Pressed: onSaved,
        body: SizedBox(
          width: 250,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SmallContainer(body: hourWheel),
              const Text(
                ':',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              SmallContainer(body: minutesWheel),
              SmallContainer(body: timeWheel),
            ],
          ),
        ),
        showDivider: true);
  }
}
