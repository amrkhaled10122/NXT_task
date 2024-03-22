import 'package:flutter/material.dart';

/// A widget to display a dashed line.
class DashedLine extends StatelessWidget {
  /// Constructs a DashedLine widget.
  ///
  /// [height]: The height of the dashed line. Defaults to 1.
  /// [color]: The color of the dashed line. Defaults to Colors.black.
  const DashedLine({
    super.key,
    this.height = 1,
    this.color = Colors.black,
  });

  /// The height of the dashed line.
  final double height;

  /// The color of the dashed line.
  final Color color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 3.0;
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
    );
  }
}
