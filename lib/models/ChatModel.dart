class ChatModel {
  final String name;
  int unread;
  String imageUrl;
  String message;
  String time;
  String lastSeen;

  ChatModel({
    required this.name,
    required this.unread,
    required this.imageUrl,
    required this.message,
    required this.time,
    required this.lastSeen,
  });
}
