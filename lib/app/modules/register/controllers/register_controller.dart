import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';

class RegisterController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  void register(String email, String password, String confirm) async {
    try {
      if (email.isEmpty && password.isEmpty) {
        Get.snackbar('Error', 'Please enter email and password');
      } else if (email.isEmpty) {
        Get.snackbar('Error', 'Please enter email');
      } else if (password.isEmpty) {
        Get.snackbar('Error', 'Please enter password');
      }

      if (confirm == password) {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        Get.snackbar('Success', 'User created successfully');
        userCredential.user!.sendEmailVerification();
        Get.defaultDialog(
            title: 'Verify your email',
            middleText:
                'Please verify your email to continue. We have sent you an email verification link.',
            textConfirm: 'OK',
            textCancel: 'Resend',
            confirmTextColor: Colors.white,
            onConfirm: () {
              Get.offAllNamed(Routes.LOGIN);
            },
            onCancel: () {
              userCredential.user!.sendEmailVerification();
              Get.snackbar('Success', 'Email verification link sent');
            });
      } else {
        Get.snackbar('Error', 'password not match');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        Get.snackbar('Error', 'No user found for that email.');
      } else if (e.code == 'invalid-credential') {
        Get.snackbar('Error', 'Wrong password provided for that user.');
      } else if (e.code == 'too-many-requests') {
        log('too-many-requests');
        Get.snackbar('Error', 'Too many requests. Try again later.');
      }
      log(e.code);
    } catch (e) {
      log("$e");
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
