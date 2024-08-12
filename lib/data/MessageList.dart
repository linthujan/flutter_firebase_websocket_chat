import 'package:flutter_firebase_websocket_chat/models/MessageModel.dart';
import 'package:flutter_firebase_websocket_chat/models/Types.dart';
import 'package:flutter_firebase_websocket_chat/models/UserModel.dart';

List<MessageModel> chatList = [
  MessageModel(
    text: "Hi",
    type: MessageType.text,
    status: MessageStatus.read,
    time: "10.30 AM",
    user: UserModel(userId: '0001', username: "Linthu", lastSeen: "10.35 AM"),
    isSender: true,
  ),
  MessageModel(
    text: "Hello",
    type: MessageType.text,
    status: MessageStatus.read,
    time: "10.31 AM",
    user: UserModel(userId: '0002', username: "Yaaro", lastSeen: "online"),
    isSender: false,
  ),
];
