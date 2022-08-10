import 'package:flutter/material.dart';

class LeftShape extends StatelessWidget {
  final double newwidth;
  const LeftShape({Key? key, this.newwidth = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 40,
          width: newwidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(200),
              bottomRight: Radius.circular(20),
            ),
            color: Colors.green,
          ),
        ),
        Text(
          'شاخص مثبت',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: 5,
        ),
      ],
    );
  }
}
