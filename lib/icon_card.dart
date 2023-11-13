// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class icon_card extends StatelessWidget {
  icon_card({super.key, this.icons, this.label});
  // ignore: prefer_typing_uninitialized_variables
  final icons;
  // ignore: prefer_typing_uninitialized_variables
  var label;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icons, size: 80, color: Colors.white),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: const TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        )
      ],
    );
  }
}
