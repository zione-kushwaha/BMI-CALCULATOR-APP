// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:monday/constant.dart';
import 'package:monday/last_column.dart';
import 'package:monday/reuable.dart';

class result_page extends StatelessWidget {
  const result_page(
      {super.key, this.resulttext, this.bmiresult, this.interpretation});
  final bmiresult;
  final resulttext;
  final interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        'BMI Result',
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Center(
              child: Container(
                child: const Text(
                  'your result',
                  style: kresult_fontstyle,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: reusable_code(
              colour: kactive_color,
              ions: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    bmiresult,
                    style: kresult_textstyle,
                  ),
                  Text(
                    resulttext,
                    style: kbmiresult,
                  ),
                  Text(
                    interpretation,
                    style: kbodytextstyle,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: last_column(
            label: 'RE-CALCULATE',
            onpress: () {
              Navigator.pop(context);
            },
          ))
        ],
      ),
    );
  }
}
