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
        case MessageType.TEXT:
          return TextMessage(message);
        case MessageType.IMAGE:
          return ImageMessage(message);
      }
    }

    return Container(
      margin: const EdgeInsets.only(top: 2),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        child: Column(
          crossAxisAlignment: message.isSender
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(message.isSender ? 0 : 10),
                  bottomLeft: Radius.circular(message.isSender ? 10 : 0),
                  topLeft: const Radius.circular(10),
                  topRight: const Radius.circular(10),
                ),
                color: message.isSender
                    ? const Color.fromARGB(71, 220, 166, 255)
                    : const Color.fromARGB(71, 220, 166, 255),
              ),
              child: Container(
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.6),
                child: buildContent(message),
              ),
            ),
            Row(
              mainAxisAlignment: message.isSender
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
                  child: Text(
                    message.time,
                    style: const TextStyle(
                      fontSize: 9.5,
                    ),
                  ),
                ),
                if (message.isSender && message.status == MessageStatus.failed)
                  const Icon(
                    Icons.error_rounded,
                    size: 16,
                    color: Colors.red,
                  ),
                if (message.isSender && message.status == MessageStatus.pending)
                  const Icon(
                    Icons.access_time_rounded,
                    size: 16,
                    color: Colors.grey,
                  ),
                if (message.isSender && message.status == MessageStatus.sent)
                  const Icon(
                    Icons.done_rounded,
                    size: 16,
                    color: Colors.grey,
                  ),
                if (message.isSender &&
                    message.status == MessageStatus.delivered)
                  const Icon(
                    Icons.done_all_rounded,
                    size: 16,
                    color: Colors.grey,
                  ),
                if (message.isSender && message.status == MessageStatus.read)
                  const Icon(
                    Icons.done_all_rounded,
                    size: 16,
                    color: Colors.deepPurpleAccent,
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
