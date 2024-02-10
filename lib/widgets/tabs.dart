import 'package:flutter/material.dart';

class Tabs extends StatelessWidget {
  const Tabs({
    Key? key,
    required this.title,
    required this.isActive,
    required this.onTap,
  }) : super(key: key);
  final String title;
  final bool isActive;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 40,
        decoration: BoxDecoration(
          color: isActive ? Colors.black : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
            child: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: isActive ? Colors.white : Colors.grey.shade600,
          ),
        )),
      ),
    );
  }
}
