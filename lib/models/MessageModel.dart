
import 'package:flutter_firebase_websocket_chat/models/UserModel.dart';

enum MessageType {
  TEXT,
  IMAGE,
}

enum MessageStatus {
  pending,
  failed,
  sent,
  delivered,
  read,
}

class MessageModel {
  MessageType type;
  MessageStatus status;
  String? text;
  String? imageUrl;
  String time;
  UserModel user;
  bool isSender;

  MessageModel({
    required this.type,
    required this.status,
    this.text,
    this.imageUrl,
    required this.time,
    required this.user,
    required this.isSender,
  });
}
