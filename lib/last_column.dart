import 'package:flutter/material.dart';
import 'constant.dart';

class last_column extends StatelessWidget {
  const last_column({@required this.label, this.onpress});
  final label;
  final onpress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        height: 80,
        child: Center(
          child: Text(
            label,
            style: klabelTextstyle,
          ),
        ),
        decoration: BoxDecoration(
            color: Colors.pink, borderRadius: BorderRadius.circular(30.0)),
      ),
    );
  }
}
