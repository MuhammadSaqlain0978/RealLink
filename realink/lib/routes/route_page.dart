import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:realink/UI/FAQ.dart';
import 'package:realink/UI/HelpUI.dart';
import 'package:realink/UI/category_hotel.dart';
import 'package:realink/UI/home_screen.dart';
import 'package:realink/UI/login.dart';
import 'package:realink/UI/notification.dart';
import 'package:realink/UI/onboarding_screen.dart';
import 'package:realink/UI/searchscreen.dart';
import 'package:realink/UI/sign_up.dart';
import 'package:realink/UI/sign_up_auth.dart';
import 'package:realink/UI/splash_screen.dart';
import 'package:realink/utils/filter.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: "/",
      name: "/SplashScreen",
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/onBoarding',
      name: 'onBoarding',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: const OnboardingScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(
      path: "/Login",
      name: "/Login",
      builder: (context, state) => const Login(),
    ),
    GoRoute(
      path: "/SignUp",
      name: "/SignUp",
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      path: "/SignUpOTP",
      name: "/SignUpOTP",
      builder: (context, state) => const SignUpAuth(),
    ),
    GoRoute(
      path: "/Home",
      name: "/Home",
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: "/CatagoryHotel",
      name: "/CatagoryHotel",
      builder: (context, state) => const CategoryHotel(),
    ),
    GoRoute(
      path: "/Search",
      name: "/Search",
      builder: (context, state) => const SearchScreen(),
    ),
    GoRoute(
      path: "/Filter",
      name: "/FilterScreen",
      builder: (context, state) => const FilterScreen(),
    ),
    GoRoute(
      path: "/Home",
      name: "/HomeScreen",
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: "/FAQs",
      name: "/FAQS",
      builder: (context, state) => const FAQPage(),
    ),
    GoRoute(
      path: "/Notification",
      name: "/Notification",
      builder: (context, state) => const NotificationPage(),
    ),
    GoRoute(
      path: "/Help",
      name: "/Help",
      builder: (context, state) => const HelpCenterPage(),
    ),
  ],
);
