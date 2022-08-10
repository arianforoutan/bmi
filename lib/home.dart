import 'dart:ui';
import 'back_chap.dart';
import 'back_rast.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final weightController = TextEditingController();
  final qadController = TextEditingController();

  double resultBMI = 0;
  String resultText = '';
  double widthGood = 10;
  double widthBad = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'BMI',
          style: TextStyle(fontSize: 30),
        ),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/1111.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Stack(
                    children: [
                      BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 3.0,
                          sigmaY: 3.0,
                        ),
                        child: SizedBox(
                          height: 50,
                          width: 200,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 130,
                                child: TextField(
                                  controller: weightController,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepOrange,
                                  ),
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'وزن',
                                    hintStyle: TextStyle(
                                      color: Colors.deepOrange.withOpacity(0.6),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 130,
                                child: TextField(
                                  controller: qadController,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepOrange,
                                  ),
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'قد',
                                    hintStyle: TextStyle(
                                      color: Colors.deepOrange.withOpacity(0.6),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 120,
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      final weight = double.parse(weightController.text);
                      final qad = double.parse(qadController.text);
                      resultBMI = weight / (qad * qad);

                      if (resultBMI > 25) {
                        widthBad = 300;
                        widthGood = 10;
                        resultText = 'شما اضافه وزن دارید';
                      } else if (resultBMI >= 18.5 && resultBMI <= 25) {
                        widthBad = 30;
                        widthGood = 300;
                        resultText = 'وزن شما نرمال است';
                      } else {
                        widthBad = 300;
                        widthGood = 30;
                        resultText = 'شما کمبود وزن دارید';
                      }

                      print(weightController.text);
                    });
                  },
                  icon: FaIcon(FontAwesomeIcons.faceSmile),
                  color: Colors.deepOrange,
                  iconSize: 50,
                ),
                Text(
                  '${resultBMI.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 68,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '$resultText',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
                LeftShape(
                  newwidth: widthGood,
                ),
                RightShape(
                  newwidth: widthBad,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'برای محاسبه روی :) کلیک کنید',
                  style: TextStyle(fontSize: 16),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
