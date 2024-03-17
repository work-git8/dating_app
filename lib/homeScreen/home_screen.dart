import 'package:dating_app/tabScreens/favorite_sent_favorite_received.dart';
import 'package:dating_app/tabScreens/like_sent_like_received.dart';
import 'package:dating_app/tabScreens/swipping_screen.dart';
import 'package:dating_app/tabScreens/user_details_screen.dart';
import 'package:dating_app/tabScreens/view_sent_view_received_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int screenIndex = 0;
  List tabScreensList = [
    SwippingScreen(),
    ViewSentViewReceivedScreen(),
    FavoriteSentFavoriteReceivedScreen(),
    LikeSentLikeReceivedScreen(),
    UserDetailsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.remove_red_eye,
                size: 30,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.star,
                size: 30,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                size: 30,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 30,
              ),
              label: ""),
        ],
        onTap: (indexNumber) {
          setState(() {
            screenIndex = indexNumber;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.red,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.white,
        currentIndex: screenIndex,
      ),
      body: tabScreensList[screenIndex],
    );
  }
}
