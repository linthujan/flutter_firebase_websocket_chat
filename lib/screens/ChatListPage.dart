import 'package:flutter/material.dart';
import 'package:flutter_firebase_websocket_chat/components/Chat.dart';
import 'package:flutter_firebase_websocket_chat/models/ChatModel.dart';
import 'package:flutter_firebase_websocket_chat/models/HttpModel.dart';
import 'package:flutter_firebase_websocket_chat/screens/ChatPage.dart';
import 'package:flutter_firebase_websocket_chat/services/api.dart';

class ChatListPage extends StatefulWidget {
  @override
  _ChatListPageState createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  List<ChatModel> chats = [];

  void _createNewChatItem() {
    // print(chatList[1].unread);
    // setState(() {
    //   chatList[1].message = "Where are you?";
    //   chatList[1].time = "02:11 PM";
    //   // chatList[1].unread = chatList[1].unread + 5;
    // });
  }

  @override
  void initState() {
    super.initState();
    _getChats();
  }

  Future<void> _getChats() async {
    print("getChats");
    HttpResponseModel? data;
    try {
      data = await getChats();
      print(data?.data);
      setState(() {
        List<ChatModel> chatList =
            data?.data.map<ChatModel>((x) => ChatModel.fromJSON(x)).toList();

        // print("Chats : ${jsonEncode(chatList)}");
        chats = chatList;
      });
    } on Exception catch (e) {
      print("error : ${e}");
      // showSnackBar(e.toString(), context);
      return;
    }
    print("data : $data");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Chats"),
      ),
      body: RefreshIndicator(
        onRefresh: _getChats,
        child: ListView.builder(
            itemCount: chats.length,
            itemBuilder: (context, index) {
              return Chat(
                chat: chats[index],
                onTap: () {
                  print(index);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChatPage(chat: chats[index])));
                },
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _createNewChatItem,
        child: const Icon(Icons.message),
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(
          label: "Chat",
          icon: Icon(Icons.chat),
        ),
        BottomNavigationBarItem(
          label: "Profile",
          icon: Icon(Icons.account_circle),
        ),
      ]),
    );
  }
}
