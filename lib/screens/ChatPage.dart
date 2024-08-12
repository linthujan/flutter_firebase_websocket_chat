import 'package:flutter/material.dart';
import 'package:flutter_firebase_websocket_chat/components/Chat.dart';
import 'package:flutter_firebase_websocket_chat/models/ChatModel.dart';

class ChatPage extends StatefulWidget {
  final ChatModel chat;

  const ChatPage({required this.chat});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<String> messages = [];

  @override
  void initState() {
    super.initState();
    // messages = widget.chat;
    messages = [
      "Hi",
      "Hello",
      "How are you",
      "Fine",
    ];
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
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  widget.chat.lastSeen,
                  style: const TextStyle(fontSize: 12),
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
              child: Text(messages[index]),
            );
          }),
    );
  }
}
