import 'package:flutter/material.dart';
import 'package:untitled16666/home/home_screen.dart';
import 'package:untitled16666/home/my_profile_screen.dart';
import 'package:untitled16666/home/plan_screen.dart';
import '../common/color.dart';
import '../common/custom_bottom_navigation_bar.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Profile App',
      home: MeScreen(),
    );
  }
}

class MeScreen extends StatelessWidget {
  const MeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Me'),
        automaticallyImplyLeading: false, // This removes the back arrow
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'WORKOUT',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const ListTile(
              title: Text('Reminder'),
              leading: Icon(Icons.notifications),
              trailing: Icon(Icons.toggle_on),
            ),
            const SizedBox(height: 20),
            const Text(
              'GENERAL SETTINGS',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SwitchListTile(
              title: const Text('Turn On Water Tracker'),
              value: true, // or false based on your state
              onChanged: (bool value) {},
            ),
            ListTile(
              title: const Text('My Profile'),
              leading: const Icon(Icons.person),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyProfileScreen()),
                );
              },
            ),
            const ListTile(
              title: Text('Restart Progress'),
              leading: Icon(Icons.refresh),
            ),
            ListTile(
              title: const Text('Language Options (TTS)'),
              leading: const Icon(Icons.language),
              trailing: DropdownButton<String>(
                value: 'English',
                items: <String>['English', 'Arabic']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (_) {},
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        onTap: (index) {
          if (index == 0) {
            // Navigate to PlanScreen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          }
        },
      ),
    );
  }
}