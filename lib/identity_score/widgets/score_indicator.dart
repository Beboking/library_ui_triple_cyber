import 'package:flutter/material.dart';
import '../../utils/responsive.dart';
import 'rounded_triangle.dart';

class ScoreIndicator extends StatelessWidget {
  const ScoreIndicator({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    Responsive rp = Responsive(context);
    return Column(
      children: [
        Container(
          child: InvertedRoundedTriangle(
            width: rp.wp(2.5),
            height: rp.wp(3),
            radius: 1.5,
            color: Colors.black,
          ),
        ),
        Container(
          height: height,
          width: 4,
          color: Color(0xFFF3F5F7),
        ),
      ],
    );
  }
}
