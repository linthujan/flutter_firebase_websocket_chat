import 'package:flutter/material.dart';
import 'package:flutter_firebase_websocket_chat/components/Message.dart';
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
    // messages = messageList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(widget.chat.image),
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
      body: Column(
        children: [
          Flexible(
            child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return Message(
                    message: messages[index],
                    onTap: () {},
                  );
                }),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20.0),
            margin: const EdgeInsets.all(8.0),
            // width: 100,
            // decoration: BoxDecoration(),
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width,
            ),
            decoration: BoxDecoration(
                color: const Color.fromARGB(120, 176, 148, 255),
                borderRadius: BorderRadius.circular(24.0)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                    child: TextFormField(
                  onFieldSubmitted: (value) {
                    print(value);
                  },
                  cursorHeight: 24,
                  decoration: const InputDecoration(
                    hintText: "Message",
                    border: InputBorder.none,
                  ),
                  // minLines: 1,
                  maxLines: null,
                )),
                const Padding(
                  padding: EdgeInsets.only(bottom: 12.0, right: 10.0),
                  child: Icon(
                    Icons.attach_file,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
