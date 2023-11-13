import 'package:flutter/material.dart';

class reusable_code extends StatelessWidget {
  reusable_code(
      {super.key, @required this.colour, required this.ions, this.onpress});
  final colour;
  final Widget ions;
  final onpress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        child: ions,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0), color: colour),
      ),
    );
  }
}
