import 'package:flutter/material.dart';

class FavoriteSentFavoriteReceivedScreen extends StatefulWidget {
  const FavoriteSentFavoriteReceivedScreen({super.key});

  @override
  State<FavoriteSentFavoriteReceivedScreen> createState() =>
      _FavoriteSentFavoriteReceivedScreenState();
}

class _FavoriteSentFavoriteReceivedScreenState
    extends State<FavoriteSentFavoriteReceivedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(child: Text("Favorite Sent Favorite Received Screen")),
      ),
    );
  }
}
