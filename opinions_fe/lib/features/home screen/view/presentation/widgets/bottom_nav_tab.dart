import "package:flutter/material.dart";
import "package:opinions/features/home%20screen/enums/bottom_navbar_enums.dart";
import "package:opinions/features/home%20screen/models/bottom_nav_tab_model.dart";

class BottomNavTab extends StatelessWidget {
  const BottomNavTab({super.key, required this.tab, required this.changeTab});

  final BottomNavTabModel tab;
  final void Function(BottomNavbarEnums tab) changeTab;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        changeTab(tab.tabType);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xFF170224),
        ),
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(tab.icon, size: 25, color: Colors.deepPurple),
              const SizedBox(height: 5),
              Text(
                tab.iconText,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
