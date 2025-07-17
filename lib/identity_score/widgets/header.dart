import 'package:flutter/material.dart';

import '../../utils/responsive.dart';

class Header extends StatelessWidget {
  final bool hasNotifications;
  final String message;

  const Header({
    super.key,
    this.hasNotifications = false,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    Responsive rp = Responsive(context);
      return Container(
        
      );
    }
  
}
