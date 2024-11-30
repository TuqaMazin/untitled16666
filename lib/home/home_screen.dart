import 'package:auto_size_text/auto_size_text.dart';
import 'package:badges/badges.dart' as badge;
import 'package:flutter/material.dart';

import '../common/color.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  _widgetTopBar(),
                  _widgetPageView(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  Widget _widgetTopBar() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        children: [
          Expanded(
            child: AutoSizeText(
              "App Name", // Replace with actual app name or dynamic text
              maxLines: 1,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(width: 10),
          badge.Badge(
            badgeStyle: badge.BadgeStyle(
              badgeColor: AppColor.commonBlueColor,
              shape: badge.BadgeShape.circle,
              padding: EdgeInsets.all(8),
            ),
            badgeContent: Text(
              '3', // Example badge content
              style: TextStyle(
                color: AppColor.white,
                fontSize: 10,
              ),
            ),
            child: Icon(Icons.notifications), // Example icon
          ),
        ],
      ),
    );
  }

  Widget _widgetPageView() {
    return Expanded(
      child: PageView(
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          Center(child: Text("Plan Screen")), // Placeholder
          Center(child: Text("Report Screen")), // Placeholder
          Center(child: Text("Me Screen")), // Placeholder
        ],
      ),
    );
  }

  Widget _bottomNavigationBar() {
    return  Column(
        mainAxisSize: MainAxisSize.min,
        children: [
        const Divider(
        color: AppColor.txtColor999,
    thickness: 0.1,
    height: 0,),
      BottomNavigationBar(
      unselectedItemColor: AppColor.txtColor666,
      selectedItemColor: AppColor.primary,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.list), // Example icon
          label: 'Plan',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.analytics), // Example icon
          label: 'Reports',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person,
          ), // Example icon
          label: 'Me',
        ),
      ],
      currentIndex: 0, // Manage current index as needed
      onTap: (index) {
        // Handle navigation
      },
    )]);
  }
}