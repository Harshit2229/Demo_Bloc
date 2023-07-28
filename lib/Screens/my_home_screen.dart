import 'package:flutter/material.dart';
import 'package:integrationapi/Screens/user_screen.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("User Screen"),
        ),
        body: Center(
          child: TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return const UserScreen();
              }));
            },
            child: const Text(
              "Get Users Detail",
              style: TextStyle(
                fontSize: 22,
              ),
            ),
          ),
        ),
        );


  }
}
