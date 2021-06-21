import 'package:flutter/material.dart';

class TopButton extends StatelessWidget {
  final Function()? callBack;
  final IconData iconData;
  const TopButton({required this.callBack, required this.iconData});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Color(0xFFE9EFF8),
      ),
      child: Center(
        child: IconButton(
          onPressed: callBack,
          icon: Icon(
            iconData,
            color: Colors.black,
            size: 20,
          ),
        ),
      ),
    );
  }
}
