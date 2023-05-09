import 'package:flutter/material.dart';

class CasesWidget extends StatelessWidget {
  const CasesWidget(
      {super.key,
      required this.cases,
      required this.text,
      required this.color});
  final Color color;
  final String text;
  final int cases;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: CircleAvatar(
              radius: 20,
              backgroundColor: color.withOpacity(0.3),
              child: CircleAvatar(
                radius: 10,
                backgroundColor: color,
              ),
            ),
          ),
          Expanded(
            child: Text(
              "$cases",
              style: TextStyle(
                  color: color, fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
