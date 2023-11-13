import 'package:flutter/material.dart';
import 'package:monday/calculation_brain.dart';
import 'reuable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_card.dart';
import 'constant.dart';
import 'result_page.dart';
import 'last_column.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0XFF1D1E33),
          scaffoldBackgroundColor: Color.fromARGB(255, 6, 8, 18)),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color male_color = kinactive_color;
  // ignore: non_constant_identifier_names
  Color female_color = kinactive_color;
  // ignore: prefer_typing_uninitialized_variables
  var selected_gender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
              child: Text(
        'BMI CALCULATOR',
        style: TextStyle(fontWeight: FontWeight.bold),
      ))),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: reusable_code(
                  onpress: () {
                    setState(() {
                      selected_gender = Gender.male;
                    });
                  },
                  colour: selected_gender == Gender.male
                      ? kactive_color
                      : kinactive_color,
                  ions: icon_card(
                    icons: FontAwesomeIcons.mars,
                    label: 'MALE',
                  ),
                )),
                Expanded(
                  child: reusable_code(
                    onpress: () {
                      setState(() {
                        selected_gender = Gender.female;
                      });
                    },
                    colour: selected_gender == Gender.female
                        ? kactive_color
                        : kinactive_color,
                    ions: icon_card(
                      icons: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: reusable_code(
              colour: kactive_color,
              ions: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: knumberTextstyle,
                      ),
                      Text(
                        'CM',
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        thumbColor: Colors.pink,
                        activeTrackColor: Colors.white,
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                        inactiveTrackColor: Color.fromARGB(255, 109, 102, 102)),
                    child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double value) {
                          setState(() {
                            height = value.toInt();
                          });
                        }),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: reusable_code(
                  colour: kactive_color,
                  ions: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'WEIGHT',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        weight.toString(),
                        style: knumberTextstyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          roundIconButton(
                            icon: FontAwesomeIcons.plus,
                            press: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          roundIconButton(
                            icon: FontAwesomeIcons.minus,
                            press: () {
                              setState(() {
                                weight--;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                )),
                Expanded(
                    child: reusable_code(
                  colour: kactive_color,
                  ions: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'AGE',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        age.toString(),
                        style: knumberTextstyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          roundIconButton(
                            icon: FontAwesomeIcons.plus,
                            press: () {
                              setState(() {
                                age++;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          roundIconButton(
                            icon: FontAwesomeIcons.minus,
                            press: () {
                              setState(() {
                                age--;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ))
              ],
            ),
          ),
          last_column(
            label: 'CALCULATE',
            onpress: () {
              calculator_brain calc =
                  calculator_brain(height: height, weight: weight);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => result_page(
                            resulttext: calc.calculateBMI(),
                            bmiresult: calc.getresult(),
                            interpretation: calc.getinterpretation(),
                          ))));
            },
          )
        ],
      ),
    );
  }
}

// ignore: camel_case_types
enum Gender {
  male,
  female;
}

class roundIconButton extends StatelessWidget {
  const roundIconButton({required this.icon, this.press});
  final IconData icon;
  final press;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      onPressed: press,
      shape: CircleBorder(),
      fillColor: Color(0xff4c4f5f),
    );
  }
}
