class ChatItemModel {
  final String name;
  int unread;
  String imageUrl;
  String message;
  String time;

  ChatItemModel({
    required this.name,
    required this.unread,
    required this.imageUrl,
    required this.message,
    required this.time,
  });
}
