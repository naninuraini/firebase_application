import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateController extends GetxController {
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void addData(String title, String description) async {
    try {
      String dateNow = DateTime.now().toString();
      await firestore
          .collection('posts')
          .add({'title': title, 'description': description, 'time': dateNow});

      Get.back();
      Get.snackbar('Success', 'Data added successfully');
      titleController.clear();
      descriptionController.clear();
    } catch (e) {
      log("$e");
    }
  }

  @override
  void onInit() {
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    titleController.dispose();
    descriptionController.dispose();
    super.onClose();
  }
}