import 'dart:async';

import 'package:animated_background/animated_background.dart';
import 'package:dating_app/pageview_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'second_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key,
  });

  @override
  State<SplashScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 15), () => Get.offAll(() => SecondScreen()));
  }

  @override
  Widget build(BuildContext context) {
    ParticleOptions particles = const ParticleOptions(
      baseColor: Colors.orangeAccent,
      spawnOpacity: 0.0,
      opacityChangeRate: 0.25,
      minOpacity: 0.1,
      maxOpacity: 0.4,
      particleCount: 70,
      spawnMaxRadius: 15.0,
      spawnMaxSpeed: 100.0,
      spawnMinSpeed: 30,
      spawnMinRadius: 7.0,
    );

    return Scaffold(
      body: Stack(alignment: Alignment.center, children: [
        Container(
          color: Colors.red,
        ),
        AnimatedBackground(
          vsync: this,
          behaviour: RandomParticleBehaviour(options: particles),
          child: Center(
              child: Text(
            'Bumble',
            style: GoogleFonts.pacifico(
                fontSize: 80,
                color: Colors.yellowAccent,
                fontWeight: FontWeight.bold),
          )),
        )
      ]),
    );
  }
}
