import 'package:flutter/material.dart';
import '../common/color.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final Function(int) onTap;

  const CustomBottomNavigationBar({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              icon: Icon(Icons.list),
              label: 'Plan',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Me',
            ),
          ],
          onTap: onTap,
        ),
      ],
    );
  }
}