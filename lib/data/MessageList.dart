import 'package:flutter_firebase_websocket_chat/models/MessageModel.dart';
import 'package:flutter_firebase_websocket_chat/models/Types.dart';
import 'package:flutter_firebase_websocket_chat/models/UserModel.dart';

List<MessageModel> messageList = [
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
  MessageModel(
    text: "How are you?",
    type: MessageType.text,
    status: MessageStatus.read,
    time: "10.31 AM",
    user: UserModel(userId: '0002', username: "Yaaro", lastSeen: "online"),
    isSender: false,
  ),
  MessageModel(
    text: "sdfgsfiuh ",
    type: MessageType.text,
    status: MessageStatus.delivered,
    time: "10.30 AM",
    user: UserModel(userId: '0001', username: "Linthu", lastSeen: "10.35 AM"),
    isSender: true,
  ),
  MessageModel(
    text: "Dolhlis kuhsgd fluhgsdf lshdisdjkf asgjhf asidfg aksujhg dasdfadf ",
    type: MessageType.text,
    status: MessageStatus.sent,
    time: "10.30 AM",
    user: UserModel(userId: '0001', username: "Linthu", lastSeen: "10.35 AM"),
    isSender: true,
  ),
  MessageModel(
    text: "asdfasd ",
    type: MessageType.text,
    status: MessageStatus.failed,
    time: "10.30 AM",
    user: UserModel(userId: '0001', username: "Linthu", lastSeen: "10.35 AM"),
    isSender: true,
  ),
  MessageModel(
    text: "gfdsgfg ",
    type: MessageType.text,
    status: MessageStatus.pending,
    time: "10.30 AM",
    user: UserModel(userId: '0001', username: "Linthu", lastSeen: "10.35 AM"),
    isSender: true,
  ),
];
