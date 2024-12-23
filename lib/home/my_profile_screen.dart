import 'package:flutter/material.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  MyProfileScreenState createState() => MyProfileScreenState();
}

class MyProfileScreenState extends State<MyProfileScreen> {
  int _height = 170; // Initial height value
  int _weight = 65;  // Initial weight value
  int _targetWeight = 60; // Initial target weight value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _widgetBack(context),
            _chooseCategories(),
            _heightWeightTargetWeightWidget(),
          ],
        ),
      ),
    );
  }

  Widget _widgetBack(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back, color: Colors.black),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Text(
              "My Profile",
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _chooseCategories() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.blue, width: 0.5),
      ),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                // Handle Kg/Cm selection
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(6),
                    bottomLeft: Radius.circular(6),
                  ),
                ),
                child: const Text(
                  "Kg / Cm",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _heightWeightTargetWeightWidget() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            _buildHeightWidget(),
            const SizedBox(height: 25),
            _buildWeightWidget(),
            const SizedBox(height: 25),
            _buildTargetWeightWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeightWidget() {
    return _buildInputRow("Height", "$_height cm", () {
      _dialogHeight();
    });
  }

  Widget _buildWeightWidget() {
    return _buildInputRow("Weight", "$_weight kg", () {
      _dialogWeight(true);
    });
  }

  Widget _buildTargetWeightWidget() {
    return _buildInputRow("Target Weight", "$_targetWeight kg", () {
      _dialogWeight(false);
    });
  }

  Widget _buildInputRow(String label, String value, VoidCallback onTap) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            value,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  void _dialogHeight() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Select Height"),
          content: SizedBox(
            height: 250,
            width: 100,
            child: ListView.builder(
              itemCount: 200,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("$index cm"),
                  onTap: () {
                    setState(() {
                      _height = index;
                    });
                    Navigator.of(context).pop();
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }

  void _dialogWeight(bool isCurrentWeight) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(isCurrentWeight ? "Select Weight" : "Select Target Weight"),
          content: SizedBox(
            height: 250,
            width: 100,
            child: ListView.builder(
              itemCount: 201,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("$index kg"),
                  onTap: () {
                    setState(() {
                      if (isCurrentWeight) {
                        _weight = index;
                      } else {
                        _targetWeight = index;
                      }
                    });
                    Navigator.of(context).pop();
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}