import 'package:flutter/material.dart';
import 'package:flutter_firebase_websocket_chat/models/ChatItemModel.dart';

class ChatItem extends StatelessWidget {
  final ChatItemModel chat;
  final VoidCallback onTap;

  ChatItem({required this.chat, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Stack(
        children: [
          const CircleAvatar(
            backgroundImage: NetworkImage(
                "https://www.strasys.uk/wp-content/uploads/2022/02/Depositphotos_484354208_S.jpg"),
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
