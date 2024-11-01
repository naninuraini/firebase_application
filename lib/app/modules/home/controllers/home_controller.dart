import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../login/views/login_view.dart';

class HomeController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance; // Instance FirebaseAuth untuk autentikasi
  FirebaseFirestore firestore = FirebaseFirestore.instance; // Instance FirebaseFirestore untuk database

  // Fungsi untuk logout
  void logout() async {
    await auth.signOut();
    Get.off(() => const LoginView()); // Navigasi ke LoginView setelah logout
  }

  // Stream untuk mendapatkan data dari koleksi 'posts' secara real-time
  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference data = firestore.collection('posts'); 
    return data.orderBy('time', descending: true).snapshots(); // Mengambil data dan mengurutkannya berdasarkan 'time'
  }

  // Fungsi untuk menghapus data
  void deleteData(String docID) {
    try {
      Get.defaultDialog(
        title: "Delete Post", // Judul dialog konfirmasi
        middleText: "Are you sure you want to delete this post?", // Pesan konfirmasi
        onConfirm: () async {
          await firestore.collection('posts').doc(docID).delete(); // Menghapus dokumen dari Firestore
          Get.back(); // Menutup dialog
          Get.snackbar('Success', 'Data deleted successfully'); // Menampilkan snackbar sukses
        },
        textConfirm: "Yes, I'm sure", // Teks tombol konfirmasi
        textCancel: "No" // Teks tombol batal
      );
    } catch (e) {
      log("$e"); // Mencetak error ke konsol
      Get.snackbar('Error', 'Cannot delete this post'); // Menampilkan snackbar error
    }
  }
}
