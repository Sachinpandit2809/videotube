import 'dart:ffi';

import 'package:flutter/widgets.dart';

extension NumExt on num {
  SizedBox get heightBox => SizedBox(height: this.toDouble());
  SizedBox get widthBox => SizedBox(width: this.toDouble());
}

extension medQue on BuildContext {
  double get medHEight => MediaQuery.of(this).size.height;
  double get medWidth => MediaQuery.of(this).size.width;
}
