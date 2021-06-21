import 'package:flutter/material.dart';

class CardO extends StatelessWidget {
  const CardO({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 8,
        top: 8,
        bottom: 8,
      ),
      width: 120,
      height: 50,
      decoration: BoxDecoration(
        color: Color(0xFFE9EFF8),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              "images/mf.jpg",
            ),
          ),
          SizedBox(
            width: 4,
          ),
          Expanded(
            child: Text(
              "Author name",
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
