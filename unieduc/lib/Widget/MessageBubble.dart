import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MessageBubble extends StatelessWidget {
  final String message;
  final String time;
  final bool isMe;

  const MessageBubble({
    Key? key,
    required this.message,
    required this.time,
    required this.isMe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime convertToString(String dateString) {
      DateFormat format = DateFormat("dd/MM/yyyy HH:mm");
      return format.parse(dateString);
    }

    DateTime formattedTime = convertToString(time);

    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          
          decoration: BoxDecoration(
            color: isMe ? Colors.blue : Colors.grey[800],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: isMe ? Radius.circular(20) : Radius.circular(0),
              bottomRight: isMe ? Radius.circular(0) : Radius.circular(20),
            ),
          ),
          width: 280,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: Column(
            crossAxisAlignment:
                isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Text(
                message,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 5),
              Text(
                "${formattedTime.toString().replaceRange(10, 10, " à ").substring(0,19)}",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
