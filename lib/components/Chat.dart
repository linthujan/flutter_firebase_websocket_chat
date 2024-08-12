import 'package:flutter/material.dart';
import 'package:flutter_firebase_websocket_chat/models/ChatModel.dart';

class Chat extends StatelessWidget {
  final ChatModel chat;
  final VoidCallback onTap;

  Chat({required this.chat, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Stack(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(chat.imageUrl),
          ),
          if (chat.unread != 0)
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 2,
                  vertical: 1,
                ),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                constraints: BoxConstraints(
                  minWidth: chat.unread < 100 ? 20 : 26,
                  maxWidth: chat.unread < 100 ? 20 : 26,
                  minHeight: 16,
                  maxHeight: 16,
                ),
                alignment: Alignment.center,
                child: Text(
                  chat.unread < 100 ? chat.unread.toString() : '99+',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            )
        ],
      ),
      title: Text(chat.name),
      subtitle: Text(chat.message),
      trailing: Text(chat.time),
    );
  }
}
