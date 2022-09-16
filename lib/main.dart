import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Image.asset(
            'assets/logo.png',
            height: 32,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(32),
                  child: Image.network(
                    "https://i.ibb.co/CwzHq4z/trans-logo-512.png",
                    width: 84,
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter your username',
                  ),
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Enter your password',
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 16),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
