import 'package:dating_app/controller/pageview_controller.dart';
import 'package:dating_app/controller/profile_controller.dart';
import 'package:dating_app/views/homeScreen/home_screen.dart';
import 'package:dating_app/views/profile/appearance.dart';
import 'package:dating_app/views/profile/background.dart';
import 'package:dating_app/views/profile/lifestyle.dart';
import 'package:dating_app/views/profile/personal_info.dart';
import 'package:dating_app/views/profile/profile_name.dart';
import 'package:dating_app/views/profile/profile_pic.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class PageViewScreen extends StatefulWidget {
  const PageViewScreen({super.key});

  @override
  State<PageViewScreen> createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {
  
  var pageviewController = Get.put(PageviewController());
  final profileController = Get.find<ProfileController>();
  List<Widget> pages = [Profile(), ProfilePic(), PersonalInfo(), AppearanceDetails(), LifeStyleDetails(), BackgroundDetails()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: pageviewController.pageController.value,
              children: pages,
              onPageChanged: (index) async {
                print(index);
                await Future.delayed(Duration(milliseconds: 500));
                pageviewController.saveToFirebase(index);
                pageviewController.currentIndex.value = index;
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.deepOrange,
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.visibility),
            Text(
              "This will be shown in your profile",
              softWrap: true,
              style: TextStyle(
                decoration: TextDecoration.none,
                color: Colors.black,
                fontSize: 15,
                fontFamily: 'Caveat',
              ),
            ),
            IconButton(
              onPressed: () async {
                if(pageviewController.currentIndex.value == pages.length-1){
                  profileController.fillBackgroundDetails(pageviewController.professionController.value.text, pageviewController.employmentStatusController.value.text, pageviewController.incomeController.value.text, pageviewController.nationalityController.value.text, pageviewController.educationController.value.text, pageviewController.languageSpokenController.value.text, pageviewController.religionController.value.text, pageviewController.ethnicityController.value.text);
                  await Future.delayed(Duration(milliseconds: 500));
                  Get.to(()=>HomeScreen());
                }else{
                pageviewController.pageController.value.nextPage(duration: Duration(milliseconds: 500), curve: Curves.linearToEaseOut);
                }
              },
              color: Colors.black,
              splashColor: Colors.amber,
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white)),
              icon: Icon(Icons.arrow_forward_ios_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
