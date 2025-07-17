
import 'package:flutter/material.dart';
import '../utils/responsive.dart';
import 'models/identity_score_model.dart';
import 'widgets/header_key_profile_detail.dart';
import 'widgets/how_you_are_doing_detail.dart';
import 'widgets/principal_card_detail.dart';
import 'widgets/ranks_detail.dart';
import 'widgets/tips_detail.dart';

class DetailsKeyProfileItem extends StatelessWidget {
  final Factor factor;
  const DetailsKeyProfileItem({super.key, required this.factor});

  @override
  Widget build(BuildContext context) {
    Responsive rp = Responsive(context);

    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(children: [
          HeaderKeyProfileDetail(title: factor.title, description:  factor.description,),
          Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: rp.wp(3)),
                width: rp.width,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: rp.hp(2),
                      ),
                     PrincipalCardDetail(factor: factor),
                      SizedBox(
                        height: rp.hpv(2, 8),
                      ),
                      RanksDetail(factor: factor),
                      SizedBox(
                        height: rp.hpv(2, 8),
                      ),
                      HowYouAreDoingDetail(factor: factor),
                      SizedBox(
                        height: rp.hpv(2, 8),
                      ),
                      TipsDetail(positiveSignals: factor.tips.positiveSignals, improveByTips: factor.tips.improveBy,)
                    ],
                  ),
                ),
              )),
        ]));
  }
}
