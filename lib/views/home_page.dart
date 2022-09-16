import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Image.asset(
          'assets/logo.png',
          height: 32,
        ),
        leading: IconButton(
          icon: Icon(
            CupertinoIcons.camera,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(
              CupertinoIcons.paperplane,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /* 사진 */
          Image.network(
            "https://cdn2.thecatapi.com/images/kat_7kqBi.png",
            width: double.infinity,
            height: 400,
            fit: BoxFit.cover,
          ),

          /* 아이콘 목록 (좋아요, 댓글, 저장) */
          Row(
            children: [
              IconButton(
                icon: Icon(
                  CupertinoIcons.heart,
                  color: Colors.black,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  CupertinoIcons.chat_bubble,
                  color: Colors.black,
                ),
                onPressed: () {},
              ),
              Spacer(),
              IconButton(
                icon: Icon(
                  CupertinoIcons.bookmark,
                  color: Colors.black,
                ),
                onPressed: () {},
              ),
            ],
          ),

          /* 좋아요 수 */
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "2 likes",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          /* 설명 */
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "My cat is docile even when bathed. I put a duck on his head in the wick and he's staring at me. Isn't it so cute? 🤭",
            ),
          ),

          /* 날짜 */
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "FEBURARY 6",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
