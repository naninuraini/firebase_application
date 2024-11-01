import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/create_controller.dart';

class CreateView extends GetView<CreateController> {
  const CreateView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Add Job Vacancy',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: controller.titleController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  labelText: 'Title',
                ),
                textInputAction: TextInputAction.next,
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
              child: TextField(
                controller: controller.descriptionController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  labelText: 'Description',
                ),
                textInputAction: TextInputAction.next,
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
              child: TextField(
                controller: controller.positionController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  labelText: 'Position',
                ),
                textInputAction: TextInputAction.next,
              ),
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFDBB7B7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                ),
                child: const Text('Add', 
                style: TextStyle(color: Colors.white),),
                onPressed: () {
                  controller.addData(
                      controller.titleController.text,
                      controller.descriptionController.text,
                      controller.positionController.text);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

