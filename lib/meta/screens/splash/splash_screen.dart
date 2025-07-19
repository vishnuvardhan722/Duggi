import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:paxzadmin/app/constants/app_route_constants.dart';
import 'package:paxzadmin/app/constants/constants.dart';
import 'package:paxzadmin/app/constants/sizeconfig.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    loadSplash();
  }

// Load the splash screen for some duration
  Future<Timer> loadSplash() async {
    return Timer(
      const Duration(seconds: 3),
      onDoneLoading,
    );
  }

  onDoneLoading() {
    (context).replaceNamed(
      MyAppRouteConstants.adminselectRouteName,
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: BconstantColors.basecolor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: SizeConfig.screenHeight! * 0.3,
              width: SizeConfig.screenWidth! * 1,
              child: Image.asset('assets/images/logo.jpg'),
            ),
            SizedBox(
              height: SizeConfig.screenHeight! * 0.05,
              child: const SequentialScalingIndicator(),
            )
          ],
        ),
      ),
    );
  }
}

class SequentialScalingIndicator extends StatefulWidget {
  const SequentialScalingIndicator({super.key});

  @override
  SequentialScalingIndicatorState createState() =>
      SequentialScalingIndicatorState();
}

class SequentialScalingIndicatorState extends State<SequentialScalingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final int _numBars = 4;
  final Duration _animationDuration = const Duration(milliseconds: 1200);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: _animationDuration,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Function to calculate the animation interval for each bar
  Interval _interval(int index) {
    final double start = index / _numBars;
    final double end = start + 1 / _numBars;
    return Interval(start, end, curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(_numBars, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              // Each bar has its own scale based on the animation progress
              double scale = 0.5;
              final Animation<double> animation =
                  Tween<double>(begin: 0.5, end: 1.0).animate(CurvedAnimation(
                      parent: _controller, curve: _interval(index)));
              scale = animation.value;
              return Container(
                width: 8,
                height: 27 * scale, // Scale height based on animation
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(scale),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
