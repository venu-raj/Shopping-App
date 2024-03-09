import 'package:flutter/material.dart';

class IconContainerWidget extends StatelessWidget {
  final Color backgroungColor;
  final String imagePath;
  final double radius;

  const IconContainerWidget({
    super.key,
    required this.backgroungColor,
    required this.imagePath,
    this.radius = 50,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroungColor,
        borderRadius: BorderRadius.all(
          Radius.circular(radius),
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Image.asset(
            imagePath,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
