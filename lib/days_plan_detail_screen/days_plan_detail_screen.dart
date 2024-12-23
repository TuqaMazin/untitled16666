import 'dart:io';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class DaysPlanDetailScreen extends StatelessWidget {
  const DaysPlanDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        bottom: !Platform.isIOS,
        child: Column(
          children: [
            Expanded(
              child: NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [_buildSliverAppBar(context)];
                },
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildWeeksList(),
                      _buildChangePlanResetProgressWidget(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSliverAppBar(BuildContext context) {
    return SliverAppBar(
      elevation: 0.8,
      expandedHeight: 200,
      pinned: true,
      backgroundColor: Colors.white,
      title: AutoSizeText(
        "Current Plan".toUpperCase(),
        textAlign: TextAlign.center,
        maxLines: 1,
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 15),
      ),
      leading: IconButton(
        icon: Icon(Icons.arrow_back_sharp, color: Colors.black),
        onPressed: () => Navigator.of(context).pop(),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/your_image.png"), // Replace with your image path
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                "Current Plan Name",
                maxLines: 1,
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 17),
              ),
              LinearProgressIndicator(
                value: 0.5, // Example progress value
                minHeight: 4,
                backgroundColor: Colors.white,
                color: Colors.blue,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  "2 Days Left",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWeeksList() {
    return ListView.builder(
      itemCount: 4, // Example week count
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemBuilder: (context, index) {
        return _buildWeekItem(index);
      },
    );
  }

  Widget _buildWeekItem(int index) {
    bool isDoneWeek = index % 2 == 0; // Example condition for completed week
    return Column(
      children: [
        Row(
          children: [
            Icon(Icons.calendar_today, size: 24),
            SizedBox(width: 8),
            Text(
              "Week ${index + 1}",
              style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
            ),
            Expanded(
              child: Text(
                isDoneWeek ? "Completed" : "Incomplete",
                textAlign: TextAlign.end,
                style: TextStyle(color: isDoneWeek ? Colors.green : Colors.red, fontSize: 14),
              ),
            ),
          ],
        ),
        _buildDaysList(index),
      ],
    );
  }

  Widget _buildDaysList(int parentIndex) {
    return ListView.builder(
      itemCount: 7, // Example days per week
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return _buildDayItem(index, parentIndex);
      },
    );
  }

  Widget _buildDayItem(int dayIndex, int parentIndex) {
    return InkWell(
      onTap: () {
        // Handle day item click
      },
      child: Container(
        height: 50,
        margin: EdgeInsets.symmetric(vertical: 4),
        padding: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: dayIndex % 2 == 0 ? Colors.lightBlueAccent : Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                "Day ${dayIndex + 1}",
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
            if (dayIndex % 2 == 0) ...{ // Example condition for completed day
              Icon(Icons.check_circle, color: Colors.green),
            } else ...{
              Icon(Icons.arrow_forward, color: Colors.grey),
            },
          ],
        ),
      ),
    );
  }

  Widget _buildChangePlanResetProgressWidget() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                // Handle change plan action
              },
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30,
                    child: Icon(Icons.swap_horiz, color: Colors.blue),
                  ),
                  Text(
                    "Change Plan",
                    style: TextStyle(color: Colors.blue, fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                // Handle reset progress action
              },
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30,
                    child: Icon(Icons.restart_alt, color: Colors.blue),
                  ),
                  Text(
                    "Restart",
                    style: TextStyle(color: Colors.blue, fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}