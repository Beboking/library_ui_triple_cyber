import 'package:flutter/material.dart';
import '../../utils/responsive.dart';
import '../models/identity_score_model.dart';

class SummaryCard extends StatelessWidget {
  final IdentityReport identityReport;

  const SummaryCard({super.key, required this.identityReport});

  @override
  @override
  Widget build(BuildContext context) {
    Responsive rp = Responsive(context);

    final oldestAccount = identityReport.summary.entries['oldestAccount'];
    final accountType = identityReport.summary.entries['accountType'];
    final totalAssets = identityReport.summary.entries['totalAssets'];
    final pendingAssets = identityReport.summary.entries['assetsPending'];

    return Align(
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Summary',
            style: TextStyle(
              fontSize: rp.dp(2.2),
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: rp.hp(.8)),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: _buildSummaryItem(
                        context,
                        title: 'Oldest Account',
                        value: "${oldestAccount?.value ?? '--'} ${oldestAccount?.unit ?? ''}",
                        status: oldestAccount?.rank ?? '',
                        statusColor: Colors.green,
                      ),
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: _buildSummaryItem(
                        context,
                        title: 'Account Type',
                        value: "${accountType?.value ?? '--'}",
                        status: accountType?.rank ?? '',
                        statusColor: Colors.orange,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24.0),
                Row(
                  children: [
                    Expanded(
                      child: _buildSummaryItem(
                        context,
                        title: 'Total assets added',
                        value: "${totalAssets?.value ?? '--'}",
                        status: totalAssets?.rank ?? '',
                        statusColor: Colors.orange,
                      ),
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: _buildSummaryItem(
                        context,
                        title: 'Assets pending verify',
                        value: "${pendingAssets?.value ?? '--'}",
                        status: pendingAssets?.rank ?? '',
                        statusColor: Colors.red,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryItem(
    BuildContext context, {
    required String title,
    required String value,
    required String status,
    required Color statusColor,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14.0,
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 4.0),
        Text(
          value,
          style: TextStyle(
            fontSize: 22.0,
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
                color: statusColor,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 8.0),
            Text(
              status,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
