import "package:flutter/material.dart";
import "package:go_router/go_router.dart";

import "package:opinions/features/create_module/view/presentation/screens/create_dashboard.dart";
import "package:opinions/features/home%20screen/enums/bottom_navbar_enums.dart";
import "package:opinions/features/home%20screen/view/presentation/screen/home_screen.dart";
import "package:opinions/features/home%20screen/view/presentation/widgets/bottom_nav_bar.dart";
import "package:opinions/features/profile_module/view/presentation/screens/profile_dashboard.dart";
import "package:opinions/features/registration/view/presentation/screens/login_screen.dart";
import "package:opinions/features/registration/view/presentation/screens/sign_up_screen.dart";
import "package:opinions/router/routes.dart";

final appRouter = GoRouter(
  initialLocation: AppRoutes.loginScreen,
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          extendBody: true,
          body: child,
          bottomNavigationBar: BottomNavBar(
            changeTab: (tab) {
              switch (tab) {
                case BottomNavbarEnums.explore:
                  context.goNamed("homeScreen");
                case BottomNavbarEnums.create:
                  context.goNamed("createScreen");
                case BottomNavbarEnums.you:
                  context.goNamed("profileScreen");
              }
            },
          ),
        );
      },
      routes: [
        GoRoute(
          path: AppRoutes.homeScreen,
          name: "homeScreen",
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: AppRoutes.createScreen,
          name: "createScreen",
          builder: (context, state) => const CreateDashboardScreen(),
        ),
        GoRoute(
          path: AppRoutes.profileScreen,
          name: "profileScreen",
          builder: (context, state) => const ProfileDashboardScreen(),
        ),
      ],
    ),
    GoRoute(
      path: AppRoutes.loginScreen,
      name: "loginScreen",
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: AppRoutes.signUpScreen,
      name: "signUpScreen",
      builder: (context, state) => const SignUpScreen(),
    ),
  ],
);