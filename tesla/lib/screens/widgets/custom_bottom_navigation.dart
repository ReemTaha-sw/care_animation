import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tesla/constanins.dart';

class CustomBottomNavigation extends StatelessWidget {
  final int selectedTab;
  final ValueChanged<int> onTap;
  CustomBottomNavigation(
      {super.key, required this.onTap, required this.selectedTab});

  final List _navigationImage = [
    "assets/icons/Lock.svg",
    "assets/icons/Charge.svg",
    "assets/icons/Temp.svg",
    "assets/icons/Tyre.svg",
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTap,
      currentIndex: selectedTab,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.black,
      items: List.generate(
          _navigationImage.length,
          (index) => BottomNavigationBarItem(
              icon: SvgPicture.asset(
                _navigationImage[index],
                colorFilter: ColorFilter.mode(
                    index == selectedTab ? primaryColor : Colors.white54,
                    BlendMode.srcIn),
              ),
              label: "")).toList(),
    );
  }
}
