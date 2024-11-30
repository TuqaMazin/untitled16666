import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled16666/choose_weight/choose_weight_screen.dart';
import '../common/color.dart';

class ChooseHeightScreen extends StatelessWidget {
  const ChooseHeightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _textHowTallAreYou(),
            _textToCalculateYourBMI(),
            _widgetHeightSelection(),
            _btnNext(context), // Pass context here
          ],
        ),
      ),
    );
  }

  Widget _textHowTallAreYou() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: const Text(
        "How Tall Are You?",
        textAlign: TextAlign.start,
        style: TextStyle(
          color: AppColor.primary,
          fontSize: 40,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _textToCalculateYourBMI() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Text(
        "To calculate your BMI",
        textAlign: TextAlign.start,
        style: TextStyle(
          color: Colors.grey[600],
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _widgetHeightSelection() {
    return Expanded(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            children: [
              Image.asset(
                "assets/icons/icon_guide_height.webp", // Update the path as needed
                height: 250,
              ),
              Expanded(child: Container()),
            ],
          ),
          // Example height selection using static values
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 400,
                  child: CupertinoPicker(
                    itemExtent: 80.0,
                    onSelectedItemChanged: (value) {
                      // Handle foot value selection
                    },
                    children: List.generate(
                      200,
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
                      // Handle inch value selection
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
                      // Handle height unit selection
                    },
                    children: const [
                      Center(child: Text("Feet", style: TextStyle(fontSize: 28))),
                      Center(child: Text("Inches", style: TextStyle(fontSize: 28))),
                      Center(child: Text("Centimeters", style: TextStyle(fontSize: 28))),
                    ],
                  ),
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
      margin: const EdgeInsets.only(bottom: 20, right: 30, left: 30),
      width: double.infinity,
      child: TextButton(
        onPressed: () {
          // Navigate to ChooseWeightScreen when next is clicked
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ChooseWeightScreen()),
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