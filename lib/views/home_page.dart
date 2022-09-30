import 'package:flutter/material.dart';

import '../widgets/feed_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /* Mock Data */
    final List<String> imageList = [
      "https://cdn2.thecatapi.com/images/bi.jpg",
      "https://cdn2.thecatapi.com/images/63g.jpg",
      "https://cdn2.thecatapi.com/images/a3h.jpg",
      "https://cdn2.thecatapi.com/images/a9m.jpg",
      "https://cdn2.thecatapi.com/images/aph.jpg",
      "https://cdn2.thecatapi.com/images/1rd.jpg",
      "https://cdn2.thecatapi.com/images/805.gif",
    ];

    return ListView.builder(
      itemCount: imageList.length,
      itemBuilder: (context, index) {
        return FeedItem(
          imageUrl: imageList[index],
        );
      },
    );
  }
}
