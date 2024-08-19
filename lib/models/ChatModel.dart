enum ChatType {
  SINGLE,
  GROUP,
}

class ChatModel {
  late String chat_id;
  late String name;
  late String type;
  String message;
  String time;
  String lastSeen;
  int unread;
  String image;

  ChatModel({
    required this.chat_id,
    required this.name,
    required this.type,
    required this.message,
    required this.time,
    required this.lastSeen,
    required this.unread,
    required this.image,
  });

  factory ChatModel.fromJSON(Map<String, dynamic> json) {
    return ChatModel(
      chat_id: json['chat_id'].toString(),
      name: json['name'].toString(),
      type: json['type'].toString(),
      message: json['message'].toString(),
      time: json['time'].toString(),
      lastSeen: json['lastSeen'].toString(),
      unread: json['unread'] ?? 0,
      image: json['image']?['uri'].toString() ?? '',
    );
  }
}
