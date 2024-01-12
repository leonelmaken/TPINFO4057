
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Model/Message.dart';
import '../Service.dart';
import '../Utils/theme.dart';
import '../Widget/MessageBubble.dart';

class Disscuss extends StatefulWidget {
  const Disscuss({Key? key}) : super(key: key);

  @override
  State<Disscuss> createState() => _DisscussState();
}

class _DisscussState extends State<Disscuss> {
  TextEditingController _messageController = TextEditingController();
  List<Message> messages = [];

  addMessage(){
    String content = _messageController.text.trim();
    DateTime now=DateTime.now();
    String date = DateFormat("dd/MM/yyyy HH:mm").format(now);
    int senderId = 1;
    int receiverId = 2;
    String senderName = "paul";
    String receiverName = "jean";


    Service.addMessage(content, date, senderId, senderName, receiverId, receiverName);
  }

  void _sendMessage() {
    final String content = _messageController.text.trim();
    DateTime now=DateTime.now();
    String time = DateFormat("dd/MM/yyyy HH:mm").format(now);
    print("la date ${DateTime.now().toString()}");
    if (content.isNotEmpty) {
      setState(() {
        messages.add(Message(
          id: 1,
          content: content,
          time:time,
          idSender: 4,
          idReceiver: 10,
     
        ));
        _messageController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SECONDARY_COLOR,
      appBar: AppBar(
        
        toolbarHeight: 40,
          leading: IconButton(onPressed: () {
            Navigator.pop(context);
          },
          
          icon: const  Icon(Icons.arrow_back_ios,size: 20,color: Colors.white,),
          
          ),
          
          elevation: 0.0,
        title: Row(
          children: const [
            CircleAvatar(
              minRadius: 15,
              maxRadius: 15,
              //backgroundImage: AssetImage('assets/images/profile.png'),
              child: Icon(
                Icons.person,
                color: Colors.white,
                size: 15,
              ),
            ),
            SizedBox(width: 10),
            Text('Ivana Georgette',style: TextStyle(fontSize: 15),),
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
                  message: message.content,
                  time: message.time,
                  isMe:index==1?true:false,
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
                    autofocus: true,
                    onSubmitted:(value) {
                      _sendMessage();
                    },
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



