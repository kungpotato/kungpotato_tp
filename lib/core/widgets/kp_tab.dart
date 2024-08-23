import 'package:flutter/material.dart';

class KpTab extends StatelessWidget {
  const KpTab({required this.text, required this.icon, super.key});

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Tab(
      icon: Icon(icon),
      child: Text(text),
    );
  }
}
