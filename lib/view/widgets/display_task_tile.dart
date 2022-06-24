import 'package:flutter/material.dart';
import 'package:to_do/res/app_context_extension.dart';

class DisplayTaskTile extends StatefulWidget {
  final String description;
  final String time;
  const DisplayTaskTile(
      {Key? key, required this.description, required this.time})
      : super(key: key);

  @override
  State<DisplayTaskTile> createState() => _DisplayTaskTileState();
}

class _DisplayTaskTileState extends State<DisplayTaskTile> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      height: 72,
      decoration: BoxDecoration(
        color: context.resources.color.buttonBlue,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      child: Row(
        children: [
          Checkbox(
              shape: const CircleBorder(),
              checkColor: context.resources.color.buttonBlue,
              fillColor:
                  MaterialStateProperty.all(context.resources.color.buttonGrey),
              value: value,
              onChanged: (value) {
                setState(() {
                  this.value = value!;
                });
              }),
          const SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                widget.description,
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
              Text(
                widget.time,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}



//  ListTile(
//           textColor: Colors.white,
//           tileColor: context.resources.color.buttonBlue,
//           leading: Checkbox(
//               shape: const CircleBorder(),
//               checkColor: context.resources.color.buttonBlue,
//               fillColor:
//                   MaterialStateProperty.all(context.resources.color.buttonGrey),
//               value: value,
//               onChanged: (value) {
//                 setState(() {
//                   this.value = value!;
//                 });
//               }),
//           title: Text(
//             widget.description,
//             style: const TextStyle(fontSize: 16),
//           ),
//           subtitle: Text(
//             widget.time,
//             style: const TextStyle(fontSize: 14, color: Colors.grey),
//           ),
//         ),