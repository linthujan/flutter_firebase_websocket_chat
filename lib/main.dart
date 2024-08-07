import 'package:flutter/material.dart';
import 'package:flutter_firebase_websocket_chat/screens/chatPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Chat'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  TextFormField(
                    decoration:
                        InputDecoration(labelText: "Enter Mobile Number"),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: "Enter Username"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "SignUp",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      onPressed: () => {},
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  TextFormField(
                    decoration:
                        InputDecoration(labelText: "Enter Mobile Number"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "SignIn",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      onPressed: () => {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
            label: "Profile", icon: Icon(Icons.account_circle)),
        BottomNavigationBarItem(label: "Chat", icon: Icon(Icons.chat))
      ]),
    );
  }
}
