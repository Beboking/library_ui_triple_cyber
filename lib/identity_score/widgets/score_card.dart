import 'package:flutter/material.dart';
import '../../utils/responsive.dart';
import '../models/identity_score_model.dart';
import 'package:intl/intl.dart';
import 'score_indicator_bar.dart';

class IdentityScoreCard extends StatelessWidget {
  const IdentityScoreCard({
    super.key,
    required this.identityReport,
  });

  final IdentityReport identityReport;

  @override
  Widget build(BuildContext context) {
    final int score = identityReport.identityScore.value;
    final int maxScore = identityReport.identityScore.max;
    final int scoreChange = identityReport.identityScore.trend;

    final formatter = DateFormat('d MMM, yyyy', 'en');
    final updateOn = formatter.format(identityReport.identityScore.lastUpdate);

    Responsive rp = Responsive(context);
    double scorePercent = score / maxScore;
    double indicatorPosition = scorePercent.clamp(0.0, 1.0);

    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: BoxBorder.all(color: Colors.grey, width: 0.5)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Identity Score",
                  style: TextStyle(fontSize: rp.dp(2.2), fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Icon(Icons.arrow_drop_up, size: rp.dp(2), color: Colors.black),
                    Text("+${scoreChange}pts",
                        style: TextStyle(color: Colors.grey[600], fontSize: rp.dp(1.2))),
                  ],
                ),
              ],
            ),
            SizedBox(height: rp.hp(3)),
            RichText(
              text: TextSpan(
                text: '$score ',
                style:
                    TextStyle(color: Colors.black, fontSize: rp.dp(3), fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: '/$maxScore',
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w500, fontSize: rp.dp(1.8)),
                  ),
                ],
              ),
            ),
            SizedBox(height: rp.hp(.8)),
            RichText(
              text: TextSpan(
                text: 'Your Score is ',
                style: TextStyle(
                    color: Colors.black, fontSize: rp.dp(1.4), fontWeight: FontWeight.w300),
                children: [
                  TextSpan(
                    text: 'Good',
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            SizedBox(height: rp.hpv(2, 4)),
            ScoreIndicatorBar(
              indicatorPosition: indicatorPosition,
              height: rp.hp(5.164),
              spacing: rp.wp(0.5),
              barHeight: rp.hp(3.873),
            ),
            SizedBox(height: rp.hpv(1, 4)),
            Container(
              height: rp.hpv(6, 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: BoxBorder.all(color: Colors.grey, width: 0.5),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Update on",
                          style: TextStyle(fontSize: rp.dp(1.1), fontWeight: FontWeight.w400),
                        ),
                        Text(
                          updateOn,
                          style: TextStyle(fontSize: rp.dp(1.4), fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: rp.hp(4),
                    width: 1,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: BoxBorder.all(color: Colors.grey, width: 0.2),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Auto update",
                          style: TextStyle(fontSize: rp.dp(1.1), fontWeight: FontWeight.w400),
                        ),
                        Text(
                          identityReport.identityScore.autoUpdateFrequency,
                          style: TextStyle(fontSize: rp.dp(1.4), fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
