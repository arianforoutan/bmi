import 'package:flutter/material.dart';

class RightShape extends StatelessWidget {
  final double newwidth;

  const RightShape({Key? key, this.newwidth = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          'شاخص منفی',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          height: 40.0,
          width: newwidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(200),
            ),
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
