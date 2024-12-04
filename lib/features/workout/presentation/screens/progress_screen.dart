import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progrès'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Suivi de vos progrès',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            // Expanded(
            //   child: LineChart(
            //     LineChartData(
            //       gridData: FlGridData(show: false),
            //       titlesData: FlTitlesData(show: false),
            //       borderData: FlBorderData(
            //         show: true,
            //         border: Border.all(color: const Color(0xff37434d), width: 1),
            //       ),
            //       minX: 0,
            //       maxX: 7,
            //       minY: 0,
            //       maxY: 6,
            //       lineBarsData: [
            //         LineChartBarData(
            //           spots: const [
            //             FlSpot(0, 3),
            //             FlSpot(2.6, 2),
            //             FlSpot(4.9, 5),
            //             FlSpot(6.8, 3.1),
            //             FlSpot(8, 4),
            //             FlSpot(9.5, 3),
            //             FlSpot(11, 4),
            //           ],
            //           isCurved: true,
            //           color: Colors.blue,
            //           barWidth: 5,
            //           isStrokeCapRound: true,
            //           dotData: FlDotData(show: false),
            //           belowBarData: BarAreaData(show: false),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}