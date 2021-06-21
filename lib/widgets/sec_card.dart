import 'package:flutter/material.dart';

class SecCard extends StatelessWidget {
  final IconData icon;
  final String text;
  final double width;
  const SecCard({
    required this.icon,
    required this.text,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      width: width,
      height: 50,
      decoration: BoxDecoration(
        color: Color(0xFFE9EFF8),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 20,
            color: Colors.blue[200],
          ),
          SizedBox(
            width: 4,
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
