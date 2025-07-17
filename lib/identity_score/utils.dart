import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart' show rootBundle;
import '../../utils/colors.dart';
import 'models/identity_score_model.dart';

Future<String> loadAssetString(String path) async {
  return await rootBundle.loadString(path);
}

Color getGaugeColor(Gauge gauge) {
  final match = gauge.ranks.firstWhere(
    (r) => gauge.pointerScore >= r.min && gauge.pointerScore <= r.max,
    orElse: () => Rank(name: '', description: '', min: 0, max: 0, color: '#9E9E9E'),
  );
  return ColorsConst.colorFromHex(match.color);
}
