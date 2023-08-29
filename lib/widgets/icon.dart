import 'package:flutter/material.dart';

class iconWidget extends StatelessWidget {
  final icon;
  
  const iconWidget({
    super.key, required this.icon,
  });

  @override
  Widget build(BuildContext context) {

    return Icon(
      icon, 
      size: 100,
      color: Color(0xff002955),
    );
  }
}