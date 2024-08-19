import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_firebase_websocket_chat/helper/common.dart';
import 'package:flutter_firebase_websocket_chat/models/HttpModel.dart';
import 'package:flutter_firebase_websocket_chat/screens/ChatListPage.dart';
import 'package:flutter_firebase_websocket_chat/screens/LoginPage.dart';
import 'package:flutter_firebase_websocket_chat/services/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _mobileContoller = TextEditingController();
  final _usernameContoller = TextEditingController();

  Future<void> _signUp() async {
    print("signUp");

    final mobile = _mobileContoller.text;
    final username = _usernameContoller.text;
    HttpResponseModel? data;
    try {
      data = await signUp(mobile, username);
    } on Exception catch (e) {
      print("error : $e");
      showSnackBar(e.toString(), context);
      return;
    }
    showSnackBar(data!.meta.message, context);
    print("data : ${jsonEncode(data.data)}");
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('user', jsonEncode(data.data?['user']));
    await prefs.setString('token', jsonEncode(data.data?['token']));

    await Navigator.push(
        context, MaterialPageRoute(builder: (context) => ChatListPage()));
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
            controller: _usernameContoller,
            decoration: const InputDecoration(labelText: "Enter Username"),
            style: const TextStyle(fontSize: 24, letterSpacing: 2),
          ),
          TextFormField(
            controller: _mobileContoller,
            decoration: const InputDecoration(labelText: "Enter Mobile"),
            style: const TextStyle(fontSize: 24, letterSpacing: 2),
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
                  onPressed: _signUp,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "SignUp",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
                ElevatedButton(
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "SignIn",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  onPressed: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()))
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
