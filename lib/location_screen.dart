import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'profile.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      log("location Denied");
      LocationPermission ask = await Geolocator.requestPermission();
    } else {
      Position currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      log("Latitude=${currentPosition.latitude.toString()}");
      log("Longitude=${currentPosition.longitude.toString()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            color: Colors.red,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 80,
                ),
                RichText(
                  text: TextSpan(
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                      children: [
                        TextSpan(
                          text: "Give us your\n",
                          style: TextStyle(color: Colors.black, fontSize: 40),
                        ),
                        TextSpan(
                          text: 'Location',
                          style: GoogleFonts.pacifico(
                              fontSize: 40,
                              color: Colors.yellowAccent,
                              decoration: TextDecoration.none),
                        ),
                      ]),
                ),
                Padding(
                  padding: EdgeInsets.all(50),
                  child: Text(
                    "We use your location to show you potential matches in your area.",
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Caveat',
                        fontStyle: FontStyle.italic),
                  ),
                ),
                SizedBox(height: 100),
                Center(
                  child: CircleAvatar(
                    radius: 70,
                    child: Icon(
                      Icons.location_pin,
                      size: 50,
                    ),
                  ),
                ),
                SizedBox(height: 100),
                SizedBox(
                    width: 300,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all(10)),
                        onPressed: () {
                          getCurrentLocation();
                        },
                        child: Text(
                          "Set Your Location",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ))),
                SizedBox(height: 10),
                GestureDetector(
                  child: Text(
                    "Not Now",
                    style: TextStyle(
                        fontSize: 18, decoration: TextDecoration.underline),
                  ),
                  onTap: () {
                    Get.to(() => Profile());
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
