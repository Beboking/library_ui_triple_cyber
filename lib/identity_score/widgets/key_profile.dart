import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../utils/responsive.dart';
import '../details_key_profile_item.dart';
import '../models/identity_score_model.dart';
import 'key_profile_item.dart';

class KeyProfile extends StatefulWidget {
  const KeyProfile({super.key, required this.identityReport});

  final IdentityReport identityReport;
  @override
  State<KeyProfile> createState() => _KeyProfileState();
}

class _KeyProfileState extends State<KeyProfile> {
  bool showFullText = false;

  @override
  Widget build(BuildContext context) {
    Responsive rp = Responsive(context);

    final keysProfiles = widget.identityReport.factors.map(
      (e) => KeyProfileItem(
        factor: e,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailsKeyProfileItem(
                      factor: e
                    )),
          );
        },
      ),
    );
    return Align(
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Key Profile Snapshot',
            style: TextStyle(
              fontSize: rp.dp(2.2),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: rp.hp(.8)),
          if (!showFullText)
            RichText(
              text: TextSpan(
                text: "See what's helping or hurt your score, and what to fix first. ",
                style: TextStyle(color: Colors.black87, fontSize: rp.dp(1.1)),
                children: [
                  TextSpan(
                    text: 'Read more',
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        setState(() {
                          showFullText = true;
                        });
                      },
                  ),
                ],
              ),
            ),
          if (showFullText)
            InkWell(
              onTap: () {
                setState(() {
                  showFullText = false;
                });
              },
              child: Text(
                "See what's helping or hurt your score, and what to fix first. "
                "These are the 6 factors used to calculate your Identity Score Record, ranked from highest "
                "to lowest impact based on their verification strength: Email address, Phone number, "
                "LinkedIn profile, Personal or professional web domain, X/Twitter account, Facebook account; "
                "Each of these factors contributes to your overall digital identity score. "
                "The more verified and trusted sources you link to your identity, the higher your credibility rating.",
                style: TextStyle(
                  fontSize: rp.dp(1.1),
                  color: Colors.black87,
                ),
              ),
            ),
          ...keysProfiles,
        ],
      ),
    );
  }
}
