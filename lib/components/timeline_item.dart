import 'package:flutter/material.dart';

class TimelineItem extends StatelessWidget {
  final Color bulletColor;
  final String time;
  final String title;
  final String date;

  const TimelineItem({
    required this.bulletColor,
    required this.time,
    required this.title,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 15, // Increase the width to create a small line segment
            height: 15, // Adjust top margin to center it vertically
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: bulletColor, // Color of the bullet line
              borderRadius:
                  BorderRadius.circular(8), // Curved ends of the bullet line
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.only(bottom: 15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: const [
                    BoxShadow(
                        blurRadius: 3,
                        color: Colors.black26,
                        offset: Offset(2, 2))
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    date,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    time,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                    softWrap: true,
                  ),
                  const SizedBox(height: 0),
                ],
              ),
            ),
          ),
          // ),
        ],
      ),
    );
  }
}
