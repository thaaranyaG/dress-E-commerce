import 'package:flutter/material.dart';

class CircleTabs extends StatelessWidget {
  const CircleTabs({
    Key? key,
    required this.isActive,
    required this.onTap,
    required this.color,
  }) : super(key: key);
  final bool isActive;
  final VoidCallback onTap;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            color: isActive ? Colors.black : Colors.transparent,
          ),
        ),
      ),
    );
  }
}
