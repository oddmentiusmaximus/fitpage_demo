import 'package:flutter/material.dart';

class DottedLine extends StatelessWidget {
  final Color color;
  final double height;
  final double width;
  final double spacing;

  const DottedLine({
    super.key,
    this.color = Colors.black,
    this.height = 1.0,
    this.width = 200.0,
    this.spacing = 5.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final boxWidth = constraints.maxWidth;
          final dashWidth = spacing;
          final dashHeight = height;

          final dashCount = (boxWidth / (2 * dashWidth)).floor();

          return Flex(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            direction: Axis.horizontal,
            children: List.generate(dashCount, (_) {
              return SizedBox(
                width: dashWidth,
                height: dashHeight,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: color),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
