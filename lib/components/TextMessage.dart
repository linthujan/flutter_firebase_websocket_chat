import 'package:flutter/material.dart';
import 'package:flutter_firebase_websocket_chat/models/MessageModel.dart';

class TextMessage extends StatelessWidget {
  final MessageModel message;

  TextMessage(this.message);

  @override
  Widget build(BuildContext context) {
    return Text(
      message.text!,
      textAlign: TextAlign.justify,
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
