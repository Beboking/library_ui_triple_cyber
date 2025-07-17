import 'package:flutter/material.dart';
import '../utils/responsive.dart';
import 'models/identity_score_model.dart';
import 'widgets/header.dart';
import 'widgets/key_profile.dart';
import 'widgets/score_card.dart';
import 'widgets/summary.dart';

class IdentityScorePage extends StatelessWidget {
  final IdentityReport identityReport;
  const IdentityScorePage({super.key, required this.identityReport});

  @override
  Widget build(BuildContext context) {
    Responsive rp = Responsive(context);

    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(children: [
          Header(
            hasNotifications: true,
            message: 'Your digital identity is good shape - keep going!',
          ),
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
                  IdentityScoreCard(
                    identityReport: identityReport,
                  ),
                  SizedBox(
                    height: rp.hpv(3, 8),
                  ),
                  KeyProfile(
                    identityReport: identityReport,
                  ),
                  SizedBox(
                    height: rp.hpv(3, 8),
                  ),
                  SummaryCard(identityReport: identityReport,),
                  SizedBox(
                    height: rp.hp(6),
                  ),
                ],
              ),
            ),
          )),
        ]));
  }
}
