
import "package:flutter/material.dart";
import 'package:opinions/features/create_module/view/presentation/screens/create_dashboard.dart';
import 'package:opinions/features/home%20screen/enums/bottom_navbar_enums.dart';
import 'package:opinions/features/home%20screen/models/bottom_nav_tab_model.dart';
import 'package:opinions/features/home%20screen/view/presentation/screen/home_screen.dart';
import 'package:opinions/features/profile_module/view/presentation/screens/profile_dashboard.dart';

 List<BottomNavTabModel> bottomNavBarData = [
   BottomNavTabModel(icon: Icons.create, iconText: "Create", tabType: BottomNavbarEnums.create, screen: CreateDashboardScreen() ),
   BottomNavTabModel(icon: Icons.explore, iconText: "Explore", tabType: BottomNavbarEnums.explore, screen: HomeScreen()),
   BottomNavTabModel(icon: Icons.person, iconText: "You", tabType: BottomNavbarEnums.you, screen: ProfileDashboardScreen())
 ];