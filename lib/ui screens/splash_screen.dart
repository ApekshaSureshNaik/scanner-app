import 'dart:async';

import 'package:flutter/material.dart';


import '../routes/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, RoutePath.LOGIN_SCREEN);
    });
    // Future.delayed(const Duration(seconds: 3), () {
    //  Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background below the curve
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              alignment: Alignment.bottomCenter,
              image: AssetImage(
                'assets/images/splash_bg.png',
              ), // replace with your image path
              fit: BoxFit.cover,
            ),
          ),
        ),

        // White curved top with logo inside
        ClipPath(
          clipper: DeepTopCurveClipper(),
          child: Container(
            height: 340,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // const SizedBox(height: 40), // space from top
                Image.asset(
                  'assets/images/splash_logo.png', // Replace with your logo path
                  height: 80,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class DeepTopCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final double curveHeight = 100;

    Path path = Path();
    path.lineTo(0, size.height - curveHeight);

    // Curve with more dip in center
    path.cubicTo(
      size.width * 0.25,
      size.height, // control point 1
      size.width * 0.75,
      size.height, // control point 2
      size.width,
      size.height - curveHeight, // end point
    );

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
