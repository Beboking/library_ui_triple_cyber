import 'package:flutter/material.dart';

class ColorsConst {
  static const Color principalGreen = Color(0xff2E6E65);
  static const Color grayBackground = Color(0xffF5F5F5);
  static const Color blueDark = Color(0xff384059);
  static const Color grayIcon = Color(0xffAFAFAF);
  static const Color redButton = Color(0xffC62C2C);
  static const Color greenLight = Color(0xff86EE60);
  static const Color buttonGreen = Color(0xFF2E6E65);
  static const Color hintColor = Color(0xffCECECE);
  static const Color inactiveTextColor = Color(0xFF707070);
  static const Color inactiveBackgroundColor = Color(0xFFf1f1f1);
  static const Color grayText = Color(0xFF4f4f4f);
  static const Color assetCircleColor = Color(0xFFF1F1F1);
  static const Color greenVerifiedText = Color(0xFF199A45);
  static const Color greyColorCardForward = Color(0xffCECECE);
  static const Color grayTextSecundary = Color(0xffA9A9A9);
  static const Color pendingColor = Color(0xffFBB03B);
  static const Color RedText = Color(0xffB11928);
  static const Color AnnonimousZone = Color(0x50C62C2C);
  static const Color lineGray = Color(0xFFCECECE);
  static const Color scoreVerifiedZone = Color(0xFF2b386d);
  static const Color scoreSecureZone = Color(0xFF199A45);
  static const Color scoreAnonymousZone = Color(0xFFB11928);

  static Color colorFromHex(String hex) {
    final buffer = StringBuffer();
    if (hex.length == 7) buffer.write('ff');
    buffer.write(hex.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
