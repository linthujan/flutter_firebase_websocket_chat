import 'package:flutter/material.dart';
import 'package:flutter_firebase_websocket_chat/models/MessageModel.dart';

class ImageMessage extends StatelessWidget {
  final MessageModel message;

  ImageMessage(this.message);

  @override
  Widget build(BuildContext context) {
    return Text(message.imageUrl!);
  }
}
