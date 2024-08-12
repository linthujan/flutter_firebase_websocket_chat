import 'package:flutter/material.dart';
import 'package:flutter_firebase_websocket_chat/components/Message.dart';
import 'package:flutter_firebase_websocket_chat/data/MessageList.dart';
import 'package:flutter_firebase_websocket_chat/models/ChatModel.dart';
import 'package:flutter_firebase_websocket_chat/models/MessageModel.dart';

class ChatPage extends StatefulWidget {
  final ChatModel chat;

  const ChatPage({required this.chat});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<MessageModel> messages = [];

  @override
  void initState() {
    super.initState();
    // messages = widget.chat;
    messages = messageList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(widget.chat.imageUrl),
            ),
            const SizedBox(width: 20 * 0.75),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.chat.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  widget.chat.lastSeen,
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.phone),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: messages.length,
          itemBuilder: (context, index) {
            return Container(
              child: Message(
                message: messages[index],
                onTap: () {},
              ),
            );
          }),
    );
  }
}
