//TODO: Implement the resources if your are going to use it

//* Here is an example

// class Resources {
//   final BuildContext _context;

//   Resources(this._context);

//   Strings get strings {
//     // It could be from the user preferences or even from the current locale
//     Locale locale = Localizations.localeOf(_context);
//     switch (locale.languageCode) {
//       case 'fr':
//         return FrenchStrings();
//       default:
//         return EnglishStrings();
//     }
//   }

//   AppColors get color {
//     return AppColors();
//   }

//   AppDimension get dimension {
//     return AppDimension();
//   }

//   static Resources of(BuildContext context) {
//     return Resources(context);
//   }
// }