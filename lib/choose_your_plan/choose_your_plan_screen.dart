import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled16666/home/home_screen.dart'; // Ensure this path is correct
import '../common/color.dart';

class ChooseYourPlanScreen extends StatelessWidget {
  const ChooseYourPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20.0),
            _textChooseYourPlan(),
            _textLoseWeightWithThePlan(),
            const SizedBox(height: 250.0),
            _choosePlanList(),
            const SizedBox(height: 20.0), // Space before button
            _btnNext(context),
          ],
        ),
      ),
    );
  }

  Widget _textChooseYourPlan() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 20),
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

    return Expanded(
      child: ListView.builder(
        itemCount: chooseYourPlanList.length,
        itemBuilder: (BuildContext context, int index) {
          return _itemChoosePlanList(index, chooseYourPlanList);
        },
      ),
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
    bool isSelected = index == 0; // Simulated selected index

    return InkWell(
      onTap: () {
        // Update the selected plan here if necessary
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? AppColor.primary : Colors.grey[300],
          borderRadius: BorderRadius.circular(100.0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        margin: const EdgeInsets.only(left: 16, right: 16, bottom: 30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/icons/${chooseYourPlanList[index].planImage}',
              height: 70,
              width: 40,
              color: isSelected ? AppColor.white : AppColor.black,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  chooseYourPlanList[index].planName ?? '',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: isSelected ? AppColor.white : AppColor.black,
                    fontSize: 23,
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
                size: 32,
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
          // Navigate to the HomeScreen when next is clicked
          Get.offAll(() => const HomeScreen()); // Use GetX for navigation
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