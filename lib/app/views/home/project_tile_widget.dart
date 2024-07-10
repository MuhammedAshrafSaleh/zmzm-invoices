import 'package:flutter/material.dart';

import '../../core/theme.dart';

// ignore: must_be_immutable
class ProjectTile extends StatelessWidget {
  String text;
  var date;
  ProjectTile({super.key, required this.text, required this.date});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppTheme.primaryColor,
      ),
      child: Column(
        children: [
          Text(
            text,
            style: const TextStyle(
                color: AppTheme.white,
                fontSize: 20,
                fontWeight: FontWeight.w700),
          ),
          // Text()
        ],
      ),
    );
  }
}
