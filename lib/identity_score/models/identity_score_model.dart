import 'dart:convert';

import '../utils.dart';

Future<IdentityReport> identityReportDummy() async {
 var data =  await loadAssetString('assets/identity_report.json');
 return IdentityReport.fromJson(jsonDecode(data));
}

/// ----------  N I V E L   R O O T  ----------
class IdentityReport {
  final IdentityScore identityScore;
  final Summary summary;
  final List<Factor> factors;

  IdentityReport({
    required this.identityScore,
    required this.summary,
    required this.factors,
  });

  factory IdentityReport.fromJson(Map<String, dynamic> json) =>
      IdentityReport(
        identityScore: IdentityScore.fromJson(json['identityScore']),
        summary: Summary.fromJson(json['summary']),
        factors: (json['factors'] as List<dynamic>)
            .map((e) => Factor.fromJson(e))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
    'identityScore': identityScore.toJson(),
    'summary': summary.toJson(),
    'factors': factors.map((e) => e.toJson()).toList(),
  };

  /// Helper para cargar desde String bruto
  static IdentityReport fromRawJson(String src) =>
      IdentityReport.fromJson(json.decode(src));

  /// Helper para convertir a String JSON
  String toRawJson() => json.encode(toJson());
}

/// ----------  S C O R E   G L O B A L  ----------
class IdentityScore {
  final int value;
  final int max;
  final int trend; // Δ desde última medición (+/-)
  final DateTime lastUpdate;
  final String autoUpdateFrequency; // e.g. "monthly"

  IdentityScore({
    required this.value,
    required this.max,
    required this.trend,
    required this.lastUpdate,
    required this.autoUpdateFrequency,
  });

  factory IdentityScore.fromJson(Map<String, dynamic> json) => IdentityScore(
    value: json['value'],
    max: json['max'],
    trend: json['trend'],
    lastUpdate: DateTime.parse(json['lastUpdate']),
    autoUpdateFrequency: json['autoUpdateFrequency'],
  );

  Map<String, dynamic> toJson() => {
    'value': value,
    'max': max,
    'trend': trend,
    'lastUpdate': lastUpdate.toIso8601String(),
    'autoUpdateFrequency': autoUpdateFrequency,
  };
}

/// ----------  S U M M A R Y  (snapshot rápido) ----------
class Summary {
  /// Entradas flexibles: la clave es el nombre que recibes del backend
  final Map<String, SummaryEntry> entries;

  Summary({required this.entries});

  factory Summary.fromJson(Map<String, dynamic> json) => Summary(
    entries: json.map(
          (k, v) => MapEntry(k, SummaryEntry.fromJson(v)),
    ),
  );

  Map<String, dynamic> toJson() =>
      entries.map((k, v) => MapEntry(k, v.toJson()));
}

class SummaryEntry {
  final dynamic value; // puede ser num, String, bool...
  final String? unit;  // opcional
  final String rank;   // "Great" | "Good" | ...

  SummaryEntry({required this.value, this.unit, required this.rank});

  factory SummaryEntry.fromJson(Map<String, dynamic> json) => SummaryEntry(
    value: json['value'],
    unit: json['unit'],
    rank: json['rank'],
  );

  Map<String, dynamic> toJson() => {
    'value': value,
    'unit': unit,
    'rank': rank,
  };
}

/// ----------  F A C T O R  D E T A L L E  ----------
class Factor {
  final String id;
  final String title;
  final String description;

  /// `value` y `unit` permiten flexibilidad:
  ///   - num → 3.5
  ///   - String → "Verified"
  final dynamic value;
  final String? unit;

  final Score score;
  final Impact impact;

  /// Línea resumen en la cabecera de detalle
  final String userSummary;

  final Gauge gauge;

  final List<HowDoing> howYouAreDoing;
  final Tips tips;

  Factor({
    required this.id,
    required this.title,
    required this.description,
    required this.value,
    required this.unit,
    required this.score,
    required this.impact,
    required this.userSummary,
    required this.gauge,
    required this.howYouAreDoing,
    required this.tips,
  });

  factory Factor.fromJson(Map<String, dynamic> json) => Factor(
    id: json['id'],
    title: json['title'],
    description: json['description'],
    value: json['value'],
    unit: json['unit'],
    score: Score.fromJson(json['score']),
    impact: Impact.fromJson(json['impact']),
    userSummary: json['userSummary'],
    gauge: Gauge.fromJson(json['gauge']),
    howYouAreDoing: (json['howYouAreDoing'] as List<dynamic>)
        .map((e) => HowDoing.fromJson(e))
        .toList(),
    tips: Tips.fromJson(json['tips']),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'description': description,
    'value': value,
    'unit': unit,
    'score': score.toJson(),
    'impact': impact.toJson(),
    'userSummary': userSummary,
    'gauge': gauge.toJson(),
    'howYouAreDoing': howYouAreDoing.map((e) => e.toJson()).toList(),
    'tips': tips.toJson(),
  };
}

class Score {
  final int value;
  final int max;

  Score({required this.value, required this.max});

  factory Score.fromJson(Map<String, dynamic> json) => Score(
    value: json['value'],
    max: json['max'],
  );

  Map<String, dynamic> toJson() => {
    'value': value,
    'max': max,
  };
}

class Impact {
  final String level; // "low" | "medium" | "high"
  final String label; // "Good", "Fair", ...

  Impact({required this.level, required this.label});

  factory Impact.fromJson(Map<String, dynamic> json) => Impact(
    level: json['level'],
    label: json['label'],
  );

  Map<String, dynamic> toJson() => {
    'level': level,
    'label': label,
  };
}

/// ----------  G A U G E  (barra de colores) ----------
class Gauge {
  final int pointerScore;
  final List<Rank> ranks;

  Gauge({required this.pointerScore, required this.ranks});

  factory Gauge.fromJson(Map<String, dynamic> json) => Gauge(
    pointerScore: json['pointerScore'],
    ranks: (json['ranks'] as List<dynamic>)
        .map((e) => Rank.fromJson(e))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'pointerScore': pointerScore,
    'ranks': ranks.map((e) => e.toJson()).toList(),
  };
}

class Rank {
  final String name;        // "Great", "Good", ...
  final String description; // "Over 2 years"
  final int min;
  final int max;
  final String color;       // Hex string "#388E3C"

  Rank({
    required this.name,
    required this.description,
    required this.min,
    required this.max,
    required this.color,
  });

  factory Rank.fromJson(Map<String, dynamic> json) => Rank(
    name: json['name'],
    description: json['description'],
    min: json['min'],
    max: json['max'],
    color: json['color'],
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'description': description,
    'min': min,
    'max': max,
    'color': color,
  };
}

/// ----------  H O W   Y O U   A R E   D O I N G ----------
class HowDoing {
  final String title;
  final String? detail; // opcional
  final DateTime? date; // opcional

  HowDoing({required this.title, this.detail, this.date});

  factory HowDoing.fromJson(Map<String, dynamic> json) => HowDoing(
    title: json['title'],
    detail: json['detail'],
    date: json['date'] != null ? DateTime.parse(json['date']) : null,
  );

  Map<String, dynamic> toJson() => {
    'title': title,
    'detail': detail,
    'date': date?.toIso8601String(),
  };
}

/// ----------  T I P S ----------
class Tips {
  final List<String> positiveSignals;
  final List<String> improveBy;

  Tips({required this.positiveSignals, required this.improveBy});

  factory Tips.fromJson(Map<String, dynamic> json) => Tips(
    positiveSignals:
    List<String>.from(json['positiveSignals'] as List<dynamic>),
    improveBy: List<String>.from(json['improveBy'] as List<dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'positiveSignals': positiveSignals,
    'improveBy': improveBy,
  };
}
