import 'package:flutter/material.dart';
import 'score_indicator.dart';

class ScoreIndicatorBar extends StatelessWidget {
  const ScoreIndicatorBar({
    super.key,
    required this.indicatorPosition,
    required this.height,
    required this.spacing,
    required this.barHeight,
  });

  final double height;
  final double spacing;
  final double barHeight;
  final double indicatorPosition;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            alignment: Alignment.center,
            children: [
              // Gradient Bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                spacing: spacing,
                children: [
                  Expanded(
                    child: Container(
                      height: barHeight,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                          begin: Alignment(0.0, 0.0),
                          end: Alignment(1.0, 0.0),
                          colors: [Color(0xfff8312f), Color(0xfff96e35)],
                          stops: [0.0, 1.0],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: barHeight,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                          begin: Alignment(-1.0, 0.0),
                          end: Alignment(1.0, 0.0),
                          colors: [
                            Color(0xfff96e35),
                            Color(0xfffbb03b),
                            Color(0xfffbb03b),
                            Color(0xffb7b240)
                          ],
                          stops: [0.0, 0.28, 0.72, 1.0],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: barHeight,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                          begin: Alignment(0.274, 0.0),
                          end: Alignment(1.0, 0.0),
                          colors: [Color(0xff1aa54a), Color(0xff137e38)],
                          stops: [0.0, 1.0],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: barHeight,
                      decoration: BoxDecoration(
                        color: const Color(0xff137e38),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ],
              ),
              // Indicator
              Positioned(
                left: indicatorPosition * constraints.maxWidth - 8,
                child: ScoreIndicator(
                  height: height,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
