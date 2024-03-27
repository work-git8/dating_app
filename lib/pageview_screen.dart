import 'package:dating_app/appearance.dart';
import 'package:dating_app/background.dart';
import 'package:dating_app/lifestyle.dart';
import 'package:dating_app/location_screen.dart';
import 'package:dating_app/mobile_number_screen.dart';
import 'package:dating_app/otp_screen.dart';
import 'package:dating_app/personal_info.dart';
import 'package:dating_app/profile.dart';
import 'package:dating_app/profile_pic.dart';
import 'package:dating_app/second_screen.dart';
import 'package:dating_app/tabScreens/user_details_screen.dart';
import 'package:flutter/material.dart';

class PageViewScreen extends StatefulWidget {
  const PageViewScreen({super.key});

  @override
  State<PageViewScreen> createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {

  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: [
          Profile(),
          ProfilePic(),
          PersonalInfo(),
          AppearanceDetails(),
          LifeStyleDetails(),
          BackgroundDetails()
        ],
      ),
    );
  }
}