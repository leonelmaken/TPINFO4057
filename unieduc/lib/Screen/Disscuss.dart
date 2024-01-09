
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Model/Message.dart';
import '../Widget/MessageBubble.dart';

class Disscuss extends StatefulWidget {
  const Disscuss({Key? key}) : super(key: key);

  @override
  State<Disscuss> createState() => _DisscussState();
}

class _DisscussState extends State<Disscuss> {
  TextEditingController _messageController = TextEditingController();
  List<Message> messages = [];

  void _sendMessage() {
    final String message = _messageController.text.trim();
    if (message.isNotEmpty) {
      setState(() {
        messages.add(Message(
          text: message,
          time: DateTime.now(),
          isMe: true,
        ));
        _messageController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          children: [
            CircleAvatar(
              //backgroundImage: AssetImage('assets/images/profile.png'),
              child: Icon(
                Icons.person,
                color: Colors.white,
                size: 30,
              ),
            ),
            SizedBox(width: 10),
            Text('Contact Name'),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: messages.length,
              itemBuilder: (BuildContext context, int index) {
                final message = messages[index];
                return MessageBubble(
                  message: message.text,
                  time: message.time,
                  isMe: message.isMe,
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            height: 60,
            color: Colors.white,
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.attach_file),
                  onPressed: () {},
                ),
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Écrivez...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  color: Colors.blue,
                  onPressed: _sendMessage,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}



