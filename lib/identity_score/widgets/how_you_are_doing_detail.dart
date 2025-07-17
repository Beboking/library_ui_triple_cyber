import 'package:flutter/material.dart';
import '../models/identity_score_model.dart';
import '../../utils/responsive.dart';
import 'package:intl/intl.dart';


class HowYouAreDoingDetail extends StatelessWidget {
  final Factor factor;

  const HowYouAreDoingDetail({
    super.key,
    required this.factor,
  });

  @override
  Widget build(BuildContext context) {
    Responsive rp = Responsive(context);

    final howYouDoing = factor.howYouAreDoing.map(
      (e) =>  HowYouDoingItem(title: e.title, date: e.date ?? DateTime.now(),),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'How you\'re doing',
          style: TextStyle(
            fontSize: rp.dp(2.4),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: rp.hp(2)),

        ...howYouDoing,
        SizedBox(height: rp.hp(1)),

        Divider(
          thickness: 2,
        ),

      ],
    );
  }
}

class HowYouDoingItem extends StatelessWidget {
  const HowYouDoingItem({
    super.key, required this.title, required this.date,
  });

  final String title;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    Responsive rp = Responsive(context);

    final formatter = DateFormat('MMMM d, yyyy');
    final dateString = 'On ${formatter.format(date)}';
    return Container(
      padding: EdgeInsets.symmetric(horizontal: rp.wp(4), vertical: rp.hp(1)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: rp.wp(10),
            height: rp.wp(10),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(rp.wp(5)),
            ),
            child: Icon(
              Icons.calendar_today_outlined,
              color: Colors.grey[700],
              size: rp.wp(6),
            ),
          ),
          SizedBox(width: rp.wp(4)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: rp.dp(1.6),
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: rp.hp(.5)),
                Text(
                  dateString,
                  style: TextStyle(
                    fontSize: rp.dp(1.3),
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
