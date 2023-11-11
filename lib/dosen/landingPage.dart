import 'dart:typed_data';

import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:informateach/dosen/database/db.dart';
import 'package:informateach/dosen/navbarConnected/add.dart';
import 'package:informateach/dosen/navbarConnected/profile.dart';
import 'package:informateach/dosen/navbarConnected/schedule.dart';
// import 'package:informateach/main.dart';

Uint8List? img;

class MyAppDosen extends StatefulWidget {
  final int initialPage;
  const MyAppDosen({Key? key, required this.initialPage}) : super(key: key);

  @override
  State<MyAppDosen> createState() => _MyAppDosenState();
}

class _MyAppDosenState extends State<MyAppDosen> {
  var indexPage = 0;
  late final PageController _pageController;
  late final NotchBottomBarController _controller;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.initialPage);
    _controller = NotchBottomBarController(index: widget.initialPage);
  }

  @override
  Widget build(BuildContext context) {
    getCurrentDosen();
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          _controller.jumpTo(index);
          setState(() {
            indexPage = index;
          });
        },
        children: const [
          ScheduleDosen(),
          AddTicket(),
          ProfileDosen(),
        ],
      ),
      extendBody: true,
      bottomNavigationBar: AnimatedNotchBottomBar(
        notchBottomBarController: _controller,
        onTap: (index) {
          _pageController.jumpToPage(
            index,
          );
          setState(() {
            indexPage = index;
          });
        },
        color: Colors.white,
        showLabel: false,
        notchColor: Colors.black87,
        bottomBarItems: const [
          BottomBarItem(
            inActiveItem: Icon(
              Icons.calendar_month,
              color: Colors.blueGrey,
            ),
            activeItem: Icon(
              Icons.calendar_month,
              color: Colors.blueAccent,
            ),
          ),
          BottomBarItem(
            inActiveItem: Icon(
              Icons.add,
              color: Colors.blueGrey,
            ),
            activeItem: Icon(
              Icons.add,
              color: Colors.blueAccent,
            ),
          ),
          BottomBarItem(
            inActiveItem: Icon(
              Icons.person,
              color: Colors.blueGrey,
            ),
            activeItem: Icon(
              Icons.person,
              color: Colors.blueAccent,
            ),
          ),
        ],
      ),
    );
  }
}
