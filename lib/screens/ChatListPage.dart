import 'package:flutter/material.dart';
import 'package:flutter_firebase_websocket_chat/components/ChatItem.dart';
import 'package:flutter_firebase_websocket_chat/data/ChatList.dart';
import 'package:flutter_firebase_websocket_chat/screens/LoginPage.dart';
import 'package:flutter_firebase_websocket_chat/screens/SignUpPage.dart';
import 'package:http/http.dart' as http;

class ChatListPage extends StatefulWidget {
  @override
  _ChatListPageState createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  void _createNewChatItem() {
    print(chatList[1].unread);
    setState(() {
      chatList[1].message = "Where are you?";
      chatList[1].time = "02:11 PM";
      chatList[1].unread = chatList[1].unread + 3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Chats"),
      ),
      body: ListView.builder(
          itemCount: chatList.length,
          itemBuilder: (context, index) {
            return ChatItem(
              chat: chatList[index],
              onTap: () {
                print(index);
                setState(() {
                  chatList[index].message = "Where are you?";
                  chatList[index].time = "02:11 PM";
                  if (chatList[index].unread > 0)
                    chatList[index].unread = 0;
                  else
                    chatList[index].unread = 100;
                });
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: _createNewChatItem,
        child: const Icon(Icons.message),
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(label: "Chat", icon: Icon(Icons.chat)),
        BottomNavigationBarItem(
            label: "Profile", icon: Icon(Icons.account_circle)),
      ]),
    );
  }
}
