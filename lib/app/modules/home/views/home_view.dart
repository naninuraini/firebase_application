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
        title: const Text('HomeView'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              controller.logout(); // Logout ketika tombol ditekan
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot<Object?>>(
        stream: controller.streamData(), // Menggunakan streamData dari controller
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.data!.size != 0) {
              var data = snapshot.data!.docs; // Mengambil data dokumen
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () =>
                        Get.toNamed(Routes.UPDATE, arguments: data[index].id), // Navigasi ke halaman UPDATE dengan ID dokumen
                    title: Text(data[index]['title']), // Menampilkan field 'title'
                    subtitle: Text(data[index]['description']), // Menampilkan field 'description'
                    trailing: IconButton(
                      onPressed: () => controller.deleteData(data[index].id), // Menghapus data
                      icon: const Icon(Icons.delete), // Ikon untuk menghapus
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: Text('No data'), // Pesan ketika tidak ada data
              );
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(), // Menampilkan indikator loading
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.CREATE); // Navigasi ke halaman CREATE
        },
        child: const Icon(Icons.add), // Ikon untuk FloatingActionButton
      ),
    );
  }
}
