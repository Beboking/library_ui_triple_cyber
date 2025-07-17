import 'package:flutter/material.dart';
import '../../utils/responsive.dart';
import '../models/identity_score_model.dart';
import '../utils.dart';

class KeyProfileItem extends StatelessWidget {
  const KeyProfileItem({super.key, required this.factor, this.onTap});

  final Factor factor;

  final Function()? onTap;


  @override
  Widget build(BuildContext context) {
    Responsive rp = Responsive(context);

    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: rp.hp(2),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: rp.wp(4),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        factor.title,
                        style: TextStyle(
                          fontSize: rp.dp(1.3),
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Row(
                        children: [
                          Container(
                            width: 8.0,
                            height: 8.0,
                            decoration: BoxDecoration(
                              color: getGaugeColor(factor.gauge),
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          Text(
                            "${factor.impact.label} | ${factor.userSummary}",
                            style: TextStyle(
                              fontSize: rp.dp(1.1),
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    factor.score.value.toString(),
                    style: TextStyle(
                      fontSize: rp.dp(2),
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 4.0),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: rp.dp(1.2),
                    color: Colors.grey[700],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12.0),
          Divider(
            height: 1.0,
            color: Colors.grey[300],
            thickness: 1.0,
          ),
        ],
      ),
    );
  }
}
