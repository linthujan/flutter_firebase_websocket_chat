import 'package:flutter/material.dart';
import 'package:flutter_firebase_websocket_chat/screens/ChatListPage.dart';
import 'package:flutter_firebase_websocket_chat/screens/SignUpPage.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _mobileNumberContoller = TextEditingController();

  Future<void> _login() async {
    final mobileNumber = _mobileNumberContoller.text;
    // final response = await http.post(Uri.parse(""))
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 64.0, horizontal: 16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: const Column(
                children: [
                  Text(
                    "Chat App",
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 64,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                  Text(
                    "Powered by Firebase",
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              )),
          TextFormField(
            decoration: const InputDecoration(labelText: "Enter Mobile Number"),
            style: TextStyle(fontSize: 24, letterSpacing: 2),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(Colors.deepPurple)),
                  child: const Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "SignIn",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  onPressed: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ChatListPage()))
                  },
                ),
                ElevatedButton(
                  child: const Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "SignUp",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  onPressed: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUpPage()))
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
