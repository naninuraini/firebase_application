import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Pastikan untuk mengimpor Firestore
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              controller.logout();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: const Text(
              'Home',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot<Object?>>(
              stream: controller.streamData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  if (snapshot.data!.size != 0) {
                    var data = snapshot.data!.docs;
                    return Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 4,
                            margin: const EdgeInsets.symmetric(vertical: 10.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: ListTile(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 5.0, horizontal: 20.0),
                              leading: const Icon(
                                Icons.work,
                                color: Color(0xFFDBB7B7),
                              ),
                              onTap: () => Get.toNamed(Routes.UPDATE,
                                  arguments: data[index]
                                      .id), // Navigasi ke halaman UPDATE dengan ID dokumen
                              title: Text(
                                data[index]['title'],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ), // Menampilkan field 'title'
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'description: ${data[index]['description']}',
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.grey),
                                  ),
                                  Text(
                                    'position: ${data[index]['position']}',
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.grey),
                                  ),
                                ],
                              ), // Menampilkan field 'description'
                              trailing: IconButton(
                                onPressed: () => controller.deleteData(
                                    data[index].id), // Menghapus data
                                icon: const Icon(
                                    Icons.delete), // Ikon untuk menghapus
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/no_data.jpg',
                            height: 100,
                          ),
                          const Text(
                            "No Data!",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFDBB7B7),
        onPressed: () {
          Get.toNamed(Routes.CREATE); // Navigasi ke halaman CREATE
        },
        child: const Icon(Icons.add,
            color: Colors.white), // Ikon untuk FloatingActionButton
      ),
    );
  }
}
