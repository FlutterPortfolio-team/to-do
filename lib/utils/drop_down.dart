// import 'package:flutter/material.dart';
// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:to_do/res/app_context_extension.dart';

// Card dropDown({
//   required BuildContext context,
//   required String title,
//   required List<String> categories,
//   final ValueChanged<Object?>? onChanged,
//   Object? selectedValue,
// }) {
//   return Card(
//     elevation: 0,
//     child: Padding(
//       padding: const EdgeInsets.only(left: 15),
//       child: SizedBox(
//         width: 200,
//         child: DropdownButtonHideUnderline(
//           child: DropdownButton2(
//             style: const TextStyle(
//               fontFamily: 'Candara',
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//               color: Colors.grey,
//             ),
//             buttonDecoration: BoxDecoration(
//               color: context.resources.color.buttonBlue,
//               borderRadius: const BorderRadius.all(
//                 Radius.circular(5),
//               ),
//             ),
//             iconEnabledColor: context.resources.color.colorWhite,
//             iconDisabledColor: context.resources.color.buttonBlue,
//             selectedItemHighlightColor: context.resources.color.buttonBlue,
//             // barrierColor: context.resources.color.buttonBlue,
//             focusColor: context.resources.color.buttonBlue,
//             icon: const Icon(Icons.keyboard_arrow_down),
//             hint: Padding(
//               padding: const EdgeInsets.only(left: 15.0),
//               child: Text(
//                 title,
//                 style: const TextStyle(
//                   fontFamily: 'Candara',
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//             ),

//             items: _addDividerAfterItems(categories),
//             customItemsIndexes: _getDividersIndexes(categories),
//             customItemsHeight: 4,
//             value: selectedValue,
//             onChanged: onChanged,
//             buttonHeight: 40,
//             buttonWidth: MediaQuery.of(context).size.width,
//             itemHeight: 40,
//             itemPadding: const EdgeInsets.symmetric(horizontal: 8.0),
//           ),
//         ),
//       ),
//     ),
//   );
// }

// List<DropdownMenuItem<String>> _addDividerAfterItems(List<String> items) {
//   List<DropdownMenuItem<String>> menuItems = [];
//   for (var item in items) {
//     menuItems.addAll([
//       DropdownMenuItem<String>(
//         value: item,
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 8.0),
//           child: Text(
//             item,
//             style: const TextStyle(
//               fontSize: 14,
//             ),
//           ),
//         ),
//       ),
//       if (item != items.last)
//         const DropdownMenuItem<String>(
//           enabled: false,
//           child: Divider(),
//         )
//     ]);
//   }
//   return menuItems;
// }

// List<int> _getDividersIndexes(List<String> categories) {
//   List<int> dividersIndexes = [];
//   for (var i = 0; i < (categories.length * 2) - 1; i++) {
//     //Dividers indexes will be the odd indexes
//     if (i.isOdd) {
//       dividersIndexes.add(i);
//     }
//   }
//   return dividersIndexes;
// }
