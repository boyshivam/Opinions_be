import "package:flutter/material.dart";
import "package:opinions/features/home%20screen/enums/bottom_navbar_enums.dart";

class BottomNavTabModel {
  const BottomNavTabModel ({
    required this.icon,
  required this.iconText,
    required this.tabType,
    required this.screen
  });

  final IconData icon;
  final String iconText;
  final BottomNavbarEnums tabType;
  final Widget screen;

}