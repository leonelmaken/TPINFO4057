class Message {
  int id;
  int idSender;
  int idReceiver;
  String content;
  String time;

  Message(
      {required this.id,
      required this.content,
      required this.time,
      required this.idSender,
      required this.idReceiver});

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json != null ? json['idMessage'] : null,
      content: json != null ? json['content'] : null,
      time: json != null ? json['time'] : null,
      idSender: json != null ? json['idSender'] : null,
      idReceiver: json != null ? json['idReceiver'] : null,
    );
  }
}
