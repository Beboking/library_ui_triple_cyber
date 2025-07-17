import 'package:flutter/material.dart';

import '../../utils/responsive.dart';

class TipsDetail extends StatelessWidget {
  final List<String> positiveSignals;
  final List<String> improveByTips;

  const TipsDetail({
    super.key,
    required this.positiveSignals,
    required this.improveByTips,
  });

  Widget _buildNumberedListItem(int index, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${index + 1}. ',
            style: const TextStyle(
              fontSize: 15,
              color: Colors.black87,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Responsive rp = Responsive(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tips',
          style: TextStyle(
            fontSize: rp.dp(2.4),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: rp.hp(2)),
        Container(
          padding: EdgeInsets.symmetric(horizontal: rp.wp(4), vertical: rp.hp(2)),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: BoxBorder.all(color: Colors.grey, width: 0.5),
          ),
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
                  Icons.info_outline,
                  color: Colors.grey[700],
                  size: rp.wp(6),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if(positiveSignals.isNotEmpty)
                      Text(
                      'Positive Signals:',
                      style: TextStyle(
                        fontSize: rp.dp(1.5),
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(height: rp.hp(1)),
                    if(positiveSignals.isNotEmpty)
                      ...positiveSignals.asMap().entries.map((entry) {
                      return _buildNumberedListItem(entry.key, entry.value);
                    }),
                    if(positiveSignals.isNotEmpty)

                      SizedBox(height: rp.hp(3)),
                    if (improveByTips.isNotEmpty)
                      Text(
                        'Improve by:',
                        style: TextStyle(
                          fontSize: rp.dp(1.5),
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                      ),
                    SizedBox(height: rp.hp(1)),
                    if (improveByTips.isNotEmpty)
                      ...improveByTips.asMap().entries.map((entry) {
                        return _buildNumberedListItem(entry.key, entry.value);
                      }),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: rp.hp(5),
        )
      ],
    );
  }
}
