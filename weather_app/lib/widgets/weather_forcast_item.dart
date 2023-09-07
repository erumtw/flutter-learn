import 'package:flutter/material.dart';

class ForecastCard extends StatelessWidget {
  final String times;
  final IconData icon;
  final String temperature;
  
  const ForecastCard({
    super.key, 
    required this.times, 
    required this.icon, 
    required this.temperature,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Container(
        width: 120,
        padding: const EdgeInsets.all(10),
        // decoration:
        //     BoxDecoration(
        //       borderRadius: BorderRadius.circular(50),
        //     ),
        child: Column(
          children: [
            Text(
              times,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Icon(
              icon,
              size: 44,
            ),
            const SizedBox(height: 10),
            Text(
              temperature,
              style: const TextStyle(
                fontSize: 16,
              ),
            )
          ],
        ),
      ),
    );
  }
}