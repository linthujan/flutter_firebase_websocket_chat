import 'package:flutter/material.dart';
import 'package:flutter_firebase_websocket_chat/screens/LoginPage.dart';

void main() {
  runApp(const FlutterChat());
}

class FlutterChat extends StatelessWidget {
  const FlutterChat({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chat',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Home(title: 'Flutter Chat'),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key, required this.title});
  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _counter = 0;
  final List<Map<String, String>> chats = [
    {'name': 'John Doe', 'message': 'Hey, how are you?', 'time': '2:30 PM'},
    {
      'name': 'Jane Smith',
      'message': 'Let\'s meet tomorrow.',
      'time': '1:15 PM'
    },
    {
      'name': 'Alex Johnson',
      'message': 'I\'ll send you the files.',
      'time': '12:45 PM'
    },
    {'name': 'Emma Brown', 'message': 'Can we reschedule?', 'time': '11:30 AM'},
    {'name': 'John Doe', 'message': 'Hey, how are you?', 'time': '2:30 PM'},
    {
      'name': 'Jane Smith',
      'message': 'Let\'s meet tomorrow.',
      'time': '1:15 PM'
    },
    {
      'name': 'Alex Johnson',
      'message': 'I\'ll send you the files.',
      'time': '12:45 PM'
    },
    {'name': 'Emma Brown', 'message': 'Can we reschedule?', 'time': '11:30 AM'},
    {'name': 'John Doe', 'message': 'Hey, how are you?', 'time': '2:30 PM'},
    {
      'name': 'Jane Smith',
      'message': 'Let\'s meet tomorrow.',
      'time': '1:15 PM'
    },
    {
      'name': 'Alex Johnson',
      'message': 'I\'ll send you the files.',







      
      'time': '12:45 PM'
    },
    {'name': 'Emma Brown', 'message': 'Can we reschedule?', 'time': '11:30 AM'},
    {'name': 'John Doe', 'message': 'Hey, how are you?', 'time': '2:30 PM'},
    {

      'name': 'Jane Smith',
      'message': 'Let\'s meet tomorrow.',
      'time': '1:15 PM'
    },
    {
      'name': 'Alex Johnson',
      'message': 'I\'ll send you the files.', 
      'time': '12:45 PM'
    },
    {'name': 'Emma Brown', 'message': 'Can we reschedule?', 'time': '11:30 AM'},
    {'name': 'John Doe', 'message': 'Hey, how are you?', 'time': '2:30 PM'},
    {
      'name': 'Jane Smith',
      'message': 'Let\'s meet tomorrow.',
      'time': '1:15 PM'
    },
    {
      'name': 'Alex Johnson',
      'message': 'I\'ll send you the files.',
      'time': '12:45 PM'
    },
    {'name': 'Emma Brown', 'message': 'Can we reschedule?', 'time': '11:30 AM'},
  ];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginPage(),
      // body: ListView.builder(
      //   itemCount: chats.length,
      //   itemBuilder: (context, index) {
      //     return ChatItem(
      //         name: chats[index]['name']!,
      //         message: chats[index]['message']!,
      //         time: chats[index]['time']!,
      //         onTap: () {
      //           print(chats[index]['name']!);
      //         });
      //   },
      // ),
      // body: Padding(
      //   padding: const EdgeInsets.all(32.0),
      //   child: Column(
      //     children: [
      //       // Container(
      //       //   child: Column(
      //       //     children: [
      //       //       TextFormField(
      //       //         decoration:
      //       //             InputDecoration(labelText: "Enter Mobile Number"),
      //       //       ),
      //       //       TextFormField(
      //       //         decoration: InputDecoration(labelText: "Enter Username"),
      //       //       ),
      //       //       Padding(
      //       //           padding: const EdgeInsets.all(8.0),
      //       //           child: Row(
      //       //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //       //             children: [
      //       //               ElevatedButton(
      //       //                 style: ButtonStyle(
      //       //                     backgroundColor:
      //       //                         WidgetStatePropertyAll(Colors.deepPurple)),
      //       //                 child: Padding(
      //       //                   padding: const EdgeInsets.all(8.0),
      //       //                   child: Text(
      //       //                     "SignUp",
      //       //                     style: TextStyle(
      //       //                         fontSize: 16, color: Colors.white),
      //       //                   ),
      //       //                 ),
      //       //                 onPressed: () => {},
      //       //               ),
      //       //               ElevatedButton(
      //       //                 child: Padding(
      //       //                   padding: const EdgeInsets.all(8.0),
      //       //                   child: Text(
      //       //                     "SignIn",
      //       //                     style: TextStyle(fontSize: 16),
      //       //                   ),
      //       //                 ),
      //       //                 onPressed: () => {},
      //       //               ),
      //       //             ],
      //       //           )),
      //       //     ],
      //       //   ),
      //       // ),
      //     ],
      //   ),
      // ),
      // bottomNavigationBar: BottomNavigationBar(items: [
      //   BottomNavigationBarItem(
      //       label: "Profile", icon: Icon(Icons.account_circle)),
      //   BottomNavigationBarItem(label: "Chat", icon: Icon(Icons.chat))
      // ]),
    );
  }
}