// TODO Implement this library.

import 'package:flutter/material.dart';

class Dash extends StatelessWidget {
  final Axis direction;
  final double length;
  final double dashLength;
  final double dashGap;
  final Color dashColor;

  const Dash({
    Key? key,
    this.direction = Axis.horizontal,
    required this.length,
    this.dashLength = 5.0,
    this.dashGap = 2.0,
    this.dashColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: direction,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        (length / (dashLength + dashGap)).floor(),
            (_) => SizedBox(
          width: direction == Axis.horizontal ? dashLength : null,
          height: direction == Axis.vertical ? dashLength : null,
          child: DecoratedBox(
            decoration: BoxDecoration(color: dashColor),
          ),
        ),
      ),
    );
  }
}
