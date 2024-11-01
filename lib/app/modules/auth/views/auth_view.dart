import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/loading.dart';
import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder<User?>(
          stream: controller.userStream,
          builder: (context, snapshot) {
            log("$snapshot");
            if (snapshot.hasData && snapshot.data!.emailVerified == true) {
              Future.microtask(() => Get.offAllNamed(Routes.HOME));
            } else {
              Future.microtask(() => Get.offAllNamed(Routes.LOGIN));
            }
            return LoadingView();
          }
        ),
      ),
    );
  }
}

