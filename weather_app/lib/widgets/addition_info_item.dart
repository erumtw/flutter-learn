import 'package:flutter/material.dart';

class AdditonalInfoItem extends StatelessWidget {
  final String value;
  final String label;
  final IconData icon;

  const AdditonalInfoItem(
      {super.key,
      required this.value,
      required this.label,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: 0,
      child: Column(
        children: [
          Icon(
            icon,
            size: 44,
          ),
          const SizedBox(height: 10),
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
