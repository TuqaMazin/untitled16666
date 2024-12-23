import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled16666/home/home_screen.dart'; // Ensure this path is correct
import '../common/color.dart';

class ChooseYourPlanScreen extends StatefulWidget {
  const ChooseYourPlanScreen({super.key});

  @override
  ChooseYourPlanScreenState createState() => ChooseYourPlanScreenState();
}

class ChooseYourPlanScreenState extends State<ChooseYourPlanScreen> {
  int _selectedIndex = 0; // Track the selected index

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Column(
          children: [
            _textSkip(context),
            const SizedBox(height: 10.0), // Space above
            _textChooseYourPlan(),
            _textLoseWeightWithThePlan(),
            const SizedBox(height: 120.0), // Increased space between text and plan list
            _choosePlanList(),
            const Spacer(), // Push the button to the bottom
            _btnNext(context),
            const SizedBox(height: 20.0), // Space below the button
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

  Widget _textChooseYourPlan() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 5),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: const Text(
        "CHOOSE YOUR PLAN",
        textAlign: TextAlign.start,
        style: TextStyle(
          color: AppColor.primary,
          fontSize: 39,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _textLoseWeightWithThePlan() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: const Text(
        "Lose weight with the plan.",
        textAlign: TextAlign.start,
        style: TextStyle(
          color: Colors.grey,
          fontSize: 25,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _choosePlanList() {
    List<ChooseYourPlanData> chooseYourPlanList = _choosePlanListData();

    return Column(
      children: List.generate(chooseYourPlanList.length, (index) {
        return Column(
          children: [
            const SizedBox(height: 20.0), // Increased space above each button
            _itemChoosePlanList(index, chooseYourPlanList),
          ],
        );
      }),
    );
  }

  List<ChooseYourPlanData> _choosePlanListData() {
    return [
      ChooseYourPlanData(
          planName: "Lose Weight And Keep Fit".tr,
          planImage: "ic_goal_lose_weight_keep.webp"),
      ChooseYourPlanData(
          planName: "Lose Belly Fat".tr,
          planImage: "ic_goal_lose_belly_fat.png"),
    ];
  }

  Widget _itemChoosePlanList(int index, List<ChooseYourPlanData> chooseYourPlanList) {
    bool isSelected = _selectedIndex == index; // Check if this index is selected

    return InkWell(
      onTap: () {
        setState(() {
          _selectedIndex = index; // Update selected index on tap
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? AppColor.primary : Colors.grey[300],
          borderRadius: BorderRadius.circular(50.0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 29),
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/icons/${chooseYourPlanList[index].planImage}',
              height: 60,
              width: 35,
              color: isSelected ? AppColor.white : AppColor.black,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Text(
                  chooseYourPlanList[index].planName ?? '',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: isSelected ? AppColor.white : AppColor.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            if (isSelected) ...{
              const Icon(
                Icons.check_circle_rounded,
                color: AppColor.white,
                size: 28,
              ),
            }
          ],
        ),
      ),
    );
  }

  Widget _btnNext(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20, right: 30, left: 30),
      width: double.infinity,
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        },
        style: TextButton.styleFrom(
          backgroundColor: AppColor.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.0),
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 12),
          child: Text(
            "NEXT",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColor.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

class ChooseYourPlanData {
  String? planName;
  String? planImage;

  ChooseYourPlanData({this.planName, this.planImage});
}