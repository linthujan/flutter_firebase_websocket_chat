import 'package:flutter/material.dart';
import 'package:flutter_firebase_websocket_chat/models/MessageModel.dart';

class ImageMessage extends StatelessWidget {
  final MessageModel message;

  ImageMessage(this.message);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          message.imageUrl!,
          // width: MediaQuery.of(context).size.width * 0.4,
        ),
        Container(
          decoration: BoxDecoration(color: Color.fromARGB(0, 41, 41, 255)),
          constraints:
              BoxConstraints(minWidth: MediaQuery.of(context).size.width),
          child: Text(
            message.text!,
            textAlign: TextAlign.justify,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
