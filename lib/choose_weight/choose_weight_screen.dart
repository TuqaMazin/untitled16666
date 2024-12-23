import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled16666/choose_target_weight/choose_target_weight_screen.dart';
import 'package:untitled16666/common/color.dart';

class ChooseWeightScreen extends StatelessWidget {
  const ChooseWeightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _textSkip(context), // Pass context here
            _textHowMuchDoYouWeight(),
            _textDescHowMuchDoYouWeight(),
            _widgetWeightSelection(),
            _btnNext(context), // Pass context here
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

  Widget _textHowMuchDoYouWeight() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: const Text(
        "How Much Do You Weigh?",
        textAlign: TextAlign.start,
        style: TextStyle(
          color: AppColor.primary,
          fontSize: 35,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _textDescHowMuchDoYouWeight() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Text(
        "Please select your weight.",
        textAlign: TextAlign.start,
        style: TextStyle(
          color: Colors.grey[600],
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _widgetWeightSelection() {
    return Expanded(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            children: [
              Image.asset(
                "assets/icons/icon_guide_weight.webp", // Update the path as needed
                height: 250,
              ),
              Expanded(child: Container()),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(left: 30, right: 20),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 400,
                    child: CupertinoPicker(
                      itemExtent: 80.0,
                      onSelectedItemChanged: (value) {
                        // Handle lbs value selection
                      },
                      children: List.generate(
                        201,
                            (index) {
                          return Center(
                            child: Text(
                              index.toString(),
                              style: const TextStyle(
                                color: AppColor.primary,
                                fontSize: 28,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 400,
                    child: CupertinoPicker(
                      itemExtent: 80.0,
                      onSelectedItemChanged: (value) {
                        // Handle kg value selection
                      },
                      children: List.generate(
                        10,
                            (index) {
                          return Center(
                            child: Text(
                              index.toString(),
                              style: const TextStyle(
                                color: AppColor.primary,
                                fontSize: 28,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 400,
                    child: CupertinoPicker(
                      itemExtent: 80.0,
                      onSelectedItemChanged: (value) {
                        // Handle weight unit selection
                      },
                      children: const [
                        Center(child: Text("Kg")),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _btnNext(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20, right: 30, left: 30),
      width: double.infinity,
      child: TextButton(
        onPressed: () {
          // Navigate to ChooseTargetWeightScreen when next is clicked
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ChooseTargetWeightScreen()),
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