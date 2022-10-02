import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/bottom_navbar_controller.dart';

class GlobalScaffold extends StatelessWidget {
  const GlobalScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /* Global State */
    final BottomNavbarController controller = Get.put(BottomNavbarController());

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
                CupertinoIcons.paperplane,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: Center(
          child: controller.currentPage,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: controller.changePage,
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