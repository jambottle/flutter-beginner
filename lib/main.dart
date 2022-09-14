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
          title: Text(
            'Hello, Flutter!',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
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
              ElevatedButton(
                onPressed: () {},
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
