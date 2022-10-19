import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/bottom_navbar_controller.dart';
import 'views/create_page.dart';

class GlobalScaffold extends StatelessWidget {
  const GlobalScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /* Global Controller */
    final BottomNavbarController navController =
        Get.put(BottomNavbarController());

    return Obx(
      () => Scaffold(
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
                CupertinoIcons.plus_app,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreatePage()),
                );
              },
            ),
            IconButton(
              icon: Icon(
                CupertinoIcons.paperplane,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: Center(
          child: navController.currentPage,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: navController.currentIndex.value,
          onTap: navController.changePage,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }
}
