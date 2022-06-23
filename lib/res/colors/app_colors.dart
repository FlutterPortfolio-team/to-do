import 'package:flutter/material.dart';
import 'package:to_do/res/colors/base_colors.dart';

enum CategoryName {
  createNew,
  home,
  movie,
  health,
  music,
  social,
  education,
  design,
  sport,
  work,
  grocery,
}

enum CategoryColorName {
  orange1,
  blue1,
  green1,
  pink1,
  pink2,
  darkBlue,
  green2,
  blue2,
  orange2,
}

class AppColors implements BaseColors {
  // final Map<int, Color> _primary = {
  //   50: const Color.fromRGBO(22, 134, 206, 0.1),
  //   100: const Color.fromRGBO(22, 134, 206, 0.2),
  //   200: const Color.fromRGBO(22, 134, 206, 0.3),
  //   300: const Color.fromRGBO(22, 134, 206, 0.4),
  //   400: const Color.fromRGBO(22, 134, 206, 0.5),
  //   500: const Color.fromRGBO(22, 134, 206, 0.6),
  //   600: const Color.fromRGBO(22, 134, 206, 0.7),
  //   700: const Color.fromRGBO(22, 134, 206, 0.8),
  //   800: const Color.fromRGBO(22, 134, 206, 0.9),
  //   900: const Color.fromRGBO(22, 134, 206, 1.0),
  // };

  // final Map<CategoryName, Color> _category = {
  //   CategoryName.home: const Color(0xFFFF8080),
  //   CategoryName.movie: const Color(0xFF80D1FF),
  //   CategoryName.health: const Color(0xFF80FFA3),
  //   CategoryName.music: const Color(0xFFFC80FF),
  //   CategoryName.social: const Color(0xFFFF80EB),
  //   CategoryName.education: const Color(0xFF809CFF),
  //   CategoryName.design: const Color(0xFF80FFD9),
  //   CategoryName.sport: const Color(0xFF80FFFF),
  //   CategoryName.work: const Color(0xFFFF9680),
  // };

  final List<Color> _categoryColor = [
    const Color(0xFFFF8080),
    const Color(0xFF80D1FF),
    const Color(0xFF80FFA3),
    const Color(0xFFFC80FF),
    const Color(0xFFFF80EB),
    const Color(0xFF809CFF),
    const Color(0xFF80FFD9),
    const Color(0xFF80FFFF),
    const Color(0xFFFF9680),
  ];
  final List<Color> _categoryIconColor = [
    const Color(0xFFC9CC41),
    const Color(0xFF66CC41),
    const Color(0xFF41CCA7),
    const Color(0xFF4181CC),
    const Color(0xFF41A2CC),
    const Color(0xFFCC8441),
    const Color(0xFF9741CC),
    const Color(0xFFCC4173),
  ];

  @override
  Color get colorAccent => const Color(0xFFFFD841);

  @override
  Color get shadowColor => const Color(0xFF808080);

  @override
  Color get colorRedTex => const Color(0xFFFF4949);

  @override
  Color get colorPrimaryText => colorWhite;

  @override
  Color get colorSecondaryText => blueAppColor;

  @override
  Color get colorWhite => const Color(0xFFFFFFFF);

  @override
  Color get colorBlack => const Color(0xFF000000);

  @override
  Color get buttonGrey => const Color(0xFFCACACA);

  @override
  Color get buttonBlue => const Color(0xFF0E2045);

  @override
  List<Color> get categoryColor => _categoryColor;

  @override
  Color get colorRed => const Color(0xFFA30000);

  @override
  Color blueAppColor = const Color(0xFF3D73DD);

  @override
  Color get taskPriorityColor => const Color(0xFF272727);

  @override
  List<Color> get categoryIconColor => _categoryIconColor;
}
