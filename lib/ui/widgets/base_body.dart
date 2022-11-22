import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BaseBody extends StatelessWidget {
  final Widget child;
  const BaseBody({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return child;
    } else {
      return SafeArea(child: child);
    }
  }
}
