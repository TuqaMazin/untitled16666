import 'package:auto_size_text/auto_size_text.dart';
import 'package:badges/badges.dart' as badge;
import 'package:flutter/material.dart';
import 'package:untitled16666/home/plan_screen.dart';

import '../common/color.dart';
import 'me_screen.dart';

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
      bottomNavigationBar: _bottomNavigationBar(context),
    );
  }

  Widget _widgetTopBar() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        children: [
          Expanded(
            child: AutoSizeText(
              "Lose Weight For Women", // Replace with actual app name or dynamic text
              maxLines: 1,
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
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
            child: Icon(Icons.notification_important), // Example icon
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
          PlanScreen(), // Include the PlanScreen here
          Center(child: Text("Me Screen")), // Placeholder for now
        ],
      ),
    );
  }

  Widget _bottomNavigationBar(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Divider(
          color: AppColor.txtColor999,
          thickness: 0.1,
          height: 0,
        ),
        BottomNavigationBar(
          unselectedItemColor: AppColor.txtColor666,
          selectedItemColor: AppColor.primary,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.list), // Example icon
              label: 'Plan',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person), // Example icon
              label: 'Me',
            ),
          ],
          onTap: (index) {
            if (index == 1) {
              // Navigate to MeScreen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  const MeScreen()),
              );
            }
            // Handle other taps if needed
          },
        ),
      ],
    );
  }
}