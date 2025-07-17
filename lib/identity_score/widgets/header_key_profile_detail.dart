import 'package:flutter/material.dart';
import '../../utils/responsive.dart';

class HeaderKeyProfileDetail extends StatelessWidget {
  const HeaderKeyProfileDetail({super.key, required this.title, required this.description});

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    Responsive rp = Responsive(context);

    return SafeArea(
        bottom: false,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: rp.wp(3)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      Icons.arrow_back,
                      size: rp.dp(2),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.public, size: rp.dp(2)),
                          SizedBox(
                            width: rp.wp(1),
                          ),
                          Text(
                            title,
                            style: TextStyle(
                                fontSize: rp.dp(1.8),
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: rp.wp(80),
                        child: Text(
                          description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: rp.dp(1.1),
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
