import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateController extends GetxController {
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  late TextEditingController positionController;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void addData(String title, String description, String position) async {
    try {
      if (title.isEmpty) {
        Get.snackbar('Error', 'Please enter title');
        return;
      } else if (description.isEmpty) {
        Get.snackbar('Error', 'Please enter description');
        return;
      } else if (position.isEmpty) {
        Get.snackbar('Error', 'Please enter position');
        return;
      }

      String dateNow = DateTime.now().toString();
      await firestore
          .collection('posts')
          .add({'title': title, 'description': description, 'position': position, 'time': dateNow});

      Get.back();
      Get.snackbar('Success', 'Data added successfully');
      titleController.clear();
      descriptionController.clear();
      positionController.clear();
    } catch (e) {
      log("$e");
    }
  }

  @override
  void onInit() {
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    positionController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    titleController.dispose();
    descriptionController.dispose();
    positionController.dispose();
    super.onClose();
  }
}
