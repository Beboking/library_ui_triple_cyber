import 'package:flutter/material.dart';
import '../../../utils/colors.dart';
import '../../utils/responsive.dart';
import '../models/identity_score_model.dart';

class RanksDetail extends StatelessWidget {
  final Factor factor;
  const RanksDetail({
    super.key,
    required this.factor,
  });
  @override
  Widget build(BuildContext context) {
    Responsive rp = Responsive(context);

    final ranks = factor.gauge.ranks.map(
      (e) => _buildRankRow(
        ColorsConst.colorFromHex(e.color),
        e.name,
        e.description,
        context,
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ranks',
          style: TextStyle(
            fontSize: rp.dp(2.4),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: rp.hp(1.5)),
        ...ranks,
        SizedBox(height: rp.hp(2)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: rp.wp(3)),
          child: Text(
            'Based on your TripleEnable report on jul o4, 2023',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
        ),
        SizedBox(height: rp.hp(2)),
        Divider(
          thickness: 2,
        )
      ],
    );
  }
}

Widget _buildRankRow(Color color, String rankText, String reportsText, BuildContext context) {
  Responsive rp = Responsive(context);

  return Padding(
    padding: EdgeInsets.symmetric(vertical: rp.hp(.8), horizontal: rp.wp(4)),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: rp.dp(.9),
          height: rp.dp(.9),
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: rp.wp(2)),
        Expanded(
          child: Text(
            rankText,
            style: TextStyle(
              fontSize: rp.dp(1.5),
              fontWeight: FontWeight.w700,
              color: Colors.black87,
            ),
          ),
        ),
        Text(
          reportsText,
          style: TextStyle(
            fontSize: rp.dp(1.5),
            color: Colors.black54,
          ),
        ),
      ],
    ),
  );
}
