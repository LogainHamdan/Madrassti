import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatRow extends StatelessWidget {
  final String sender;
  final String msg;
  final int time;
  final String timeUnit;

  const ChatRow({
    super.key,
    required this.sender,
    required this.msg,
    required this.time,
    required this.timeUnit,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Use the helper function for time unit text
            _getTimeText(),
            SizedBox(width: 5),
            Icon(
              CupertinoIcons.time,
              size: 16,
              color: Colors.grey[400],
            ),
          ],
        ),
        Column(
          crossAxisAlignment:
              CrossAxisAlignment.end, // Align sender text to the right
          children: [
            Text(
              sender,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontFamily: 'Rubik',
                fontSize: 20,
              ),
            ),
            SizedBox(),
            Text(
              msg,
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Rubik',
                fontSize: 14,
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Function to get the time text based on the time unit
  Widget _getTimeText() {
    switch (timeUnit) {
      case 'm':
        return Text(
          'قبل $time دقائق',
          style: TextStyle(
            color: Colors.grey[400],
            fontFamily: 'Rubik',
            fontSize: 14,
          ),
        );
      case 's':
        return Text(
          'قبل $time ثوان',
          style: TextStyle(
            color: Colors.grey[400],
            fontFamily: 'Rubik',
            fontSize: 14,
          ),
        );
      default:
        return Text(
          'قبل $timeساعة', // Default to seconds if no match
          style: TextStyle(
            color: Colors.grey[400],
            fontFamily: 'Rubik',
            fontSize: 14,
          ),
        );
    }
  }
}
