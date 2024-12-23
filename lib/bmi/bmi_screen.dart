import 'package:flutter/material.dart';
import 'package:untitled16666/choose_your_plan/choose_your_plan_screen.dart';
import 'package:untitled16666/common/color.dart';

class BMIScreen extends StatelessWidget {
  const BMIScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Replace with your desired color
      body: SafeArea(
        child: Column(
          children: [
            _textSkip(context),
            _textChangeStartsToday(),
            _textTargetBMI(),
            _widgetBMIGraph(),
            _btnNext(context),
          ],
        ),
      ),
    );
  }

  Widget _textSkip(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 24, right: 30, top: 30),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context); // Navigate back to the previous screen
            },
            child: const Icon(Icons.arrow_back), // Back button
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              // Handle skip action
            },
            child: Text(
              "SKIP",
              textAlign: TextAlign.end,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _textChangeStartsToday() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: const Text(
        "CHANGE STARTS TODAY",
        textAlign: TextAlign.start,
        style: TextStyle(
          color: AppColor.primary, // Replace with your desired primary color
          fontSize: 35,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _textTargetBMI() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 5),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        "TARGET BMI",
        textAlign: TextAlign.start,
        style: TextStyle(
          color: Colors.grey[600],
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _widgetBMIGraph() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/weight_chart.webp', // Replace with your asset path
            height: 200, // Replace with your desired height
          ),
          Container(
            margin: const EdgeInsets.only(top: 20, bottom: 10),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "24.5", // Replace with dynamic value if needed
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  " BMI",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "CURRENT BMI - ",
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                "NORMAL", // Replace with dynamic value if needed
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _btnNext(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30, right: 20, left: 20),
      width: double.infinity,
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ChooseYourPlanScreen()),
          );
        },
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(AppColor.primary), // Replace with your desired color
          elevation: WidgetStateProperty.all(2),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100.0),
              side: const BorderSide(color: Colors.transparent, width: 0.7),
            ),
          ),
        ),
        child: const Padding(
          padding:  EdgeInsets.symmetric(vertical: 10),
          child: Text(
            "NEXT",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}