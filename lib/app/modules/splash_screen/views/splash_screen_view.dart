import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/routes/app_pages.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration(seconds: 3),
      () {
        Get.offAllNamed(Routes.AUTH);
      },
    );
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logoJobSpot.png',
                    height: 150,
                  ),
                  SizedBox(height: 30),
                  Text(
                    'JobSpot',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0), 
            child: Text(
              'by Nani Nuraini',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
