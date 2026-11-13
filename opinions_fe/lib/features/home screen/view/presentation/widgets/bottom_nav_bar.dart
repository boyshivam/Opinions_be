import "package:flutter/material.dart";
import "package:opinions/features/home%20screen/data/bottom_nav_bar_data.dart";
import "package:opinions/features/home%20screen/enums/bottom_navbar_enums.dart";
import "package:opinions/features/home%20screen/view/presentation/widgets/bottom_nav_tab.dart";

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key, required this.changeTab});

  final void Function(BottomNavbarEnums tab) changeTab;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 25),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(38)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            bottomNavBarData.length,
            (index) => BottomNavTab(tab: bottomNavBarData[index], changeTab: changeTab ,),
          ),
        ),
      ),
    );
  }
}
