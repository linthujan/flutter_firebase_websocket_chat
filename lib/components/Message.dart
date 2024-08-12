import 'package:flutter/material.dart';
import 'package:flutter_firebase_websocket_chat/components/ImageMessage.dart';
import 'package:flutter_firebase_websocket_chat/components/TextMessage.dart';
import 'package:flutter_firebase_websocket_chat/models/MessageModel.dart';

class Message extends StatelessWidget {
  final MessageModel message;
  final VoidCallback onTap;

  Message({required this.message, required this.onTap});

  @override
  Widget build(BuildContext context) {
    Widget buildContent(MessageModel message) {
      switch (message.type) {
        case MessageType.text:
          return TextMessage(message);
        case MessageType.image:
          return ImageMessage(message);
      }
    }

    return Container(
      child: Column(
        children: [
          buildContent(message),
        ],
      ),
    );
  }
}
