import 'dart:io';

import 'package:dating_app/controller/image_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
              name: "dating-app-ab16e",
              options: const FirebaseOptions(
                  apiKey: 'AIzaSyBPtBSt6MFX09iXj56oO9NsZwRrf1DhPO8',
                  appId: '1:136362130488:android:4713b051d088ae94d67acd',
                  messagingSenderId: '136362130488',
                  projectId: 'dating-app-ab16e',
                  storageBucket: "dating-app-ab16e.appspot.com"
                  ))
          .then((value) {
          Get.put(ImageController());
        })
      : await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
