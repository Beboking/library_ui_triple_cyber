import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../utils/colors.dart';
import '../../utils/responsive.dart';
import '../models/identity_score_model.dart';
import 'score_indicator_bar.dart';

class PrincipalCardDetail extends StatelessWidget {
  final Factor factor;
  const PrincipalCardDetail({super.key, required this.factor});

  @override
  Widget build(BuildContext context) {

    Responsive rp = Responsive(context);
    double scorePercent = factor.score.value / factor.score.max;
    double indicatorPosition = scorePercent.clamp(0.0, 1.0);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: rp.wp(4)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          if(factor.title.toLowerCase() == 'account type')
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${factor.value}',
                      style: TextStyle(
                        fontSize: rp.dp(4),
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      factor.userSummary,
                      style: TextStyle(
                        fontSize: rp.dp(1.4),
                        fontWeight: FontWeight.w400,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),

                Container(
                  width: rp.wp(10),
                  height: rp.wp(10),
                  padding: EdgeInsets.all(rp.wp(2) ),
                  decoration: BoxDecoration(
                      color: ColorsConst.blueDark,
                      borderRadius: BorderRadius.all(Radius.circular(rp.wp(5)))

                  ),
                  child: SvgPicture.asset(
                    'assets/verified.svg',
                    color: Colors.white,
                  ),
                )
              ],
            ),

          if(factor.title.toLowerCase() == 'account age')
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${factor.score.value}',
                style: TextStyle(
                  fontSize: rp.dp(4),
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                "${factor.value} ${factor.unit}",
                style: TextStyle(
                  fontSize: rp.dp(1.4),
                  fontWeight: FontWeight.w400,
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),
          if(factor.title.toLowerCase() != 'account type' && factor.title.toLowerCase() != 'account age')
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  RichText(
                    text: TextSpan(
                      text: factor.score.value.toString(),
                      style:
                      TextStyle(color: Colors.black, fontSize: rp.dp(4), fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text: ' /${factor.score.max}',
                          style: TextStyle(
                              color: Colors.grey.shade400, fontWeight: FontWeight.w500, fontSize: rp.dp(2.4)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: rp.hp(.5)),
                  Text(
                    factor.userSummary,
                    style: TextStyle(
                      fontSize: rp.dp(1.4),
                      color: Colors.grey[700],
                    ),
                  ),

                ],
              ),
            ],
          ),
          SizedBox(
            height: rp.hp(2),
          ),
          ScoreIndicatorBar(
            indicatorPosition: indicatorPosition,
            height: rp.hp(2.2),
            spacing: rp.wp(0.5),
            barHeight: rp.hp(1),
          ),
          SizedBox(
            height: rp.hp(1.5),
          ),
          Text(
            '${factor.impact.label} | ${factor.impact.level} impact',
            style: TextStyle(
              fontSize: rp.dp(1.4),
              fontWeight: FontWeight.bold,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }
}
