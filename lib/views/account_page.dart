import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 80,
                    height: 80,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://avatars.githubusercontent.com/u/72926450?v=4',
                      ),
                    ),
                  ),
                  Container(
                    width: 80,
                    height: 80,
                    alignment: Alignment.bottomRight,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 28,
                          height: 28,
                          child: FloatingActionButton(
                            backgroundColor: Colors.white,
                            onPressed: () {},
                          ),
                        ),
                        SizedBox(
                          width: 24,
                          height: 24,
                          child: FloatingActionButton(
                            backgroundColor: Colors.blue,
                            child: Icon(Icons.add),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
              ),
              Text(
                '(이름)',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Text(
            '0\n게시물',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
          Text(
            '0\n팔로워',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
          Text(
            '0\n팔로잉',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
