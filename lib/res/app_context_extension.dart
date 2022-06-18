import 'package:flutter/material.dart';
import 'package:to_do/res/resources.dart';

extension AppContext on BuildContext {
  Resources get resources => Resources.of(this);
}
