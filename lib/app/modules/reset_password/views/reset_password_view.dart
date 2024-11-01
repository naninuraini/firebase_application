import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/modules/reset_password/controllers/reset_password_controller.dart';
import '../../../routes/app_pages.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logoJobSpot.png',
                  height: 100,
                ),
                const SizedBox(height: 30),
                const Text(
                  'RESET PASSWORD',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: controller.emailController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                    labelText: 'E-mail',
                    labelStyle: const TextStyle(color: Colors.grey),
                  ),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Get.offAllNamed(Routes.LOGIN);
                  },
                  child: const Text('Back to Log in'),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFDBB7B7),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                    ),
                    child: const Text(
                      'Reset Password',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () => controller
                        .resetPassword(controller.emailController.text),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../routes/app_pages.dart';
// import '../controllers/reset_password_controller.dart';

// class ResetPasswordView extends GetView<ResetPasswordController> {
//   const ResetPasswordView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('ResetPasswordView'),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(10),
//         child: ListView(
//           children: [
//             Container(
//               alignment: Alignment.center,
//               padding: const EdgeInsets.all(10),
//               child: const Text(
//                 'Flutter Reset Password Page',
//                                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                     color: Colors.indigo,
//                     fontWeight: FontWeight.w500,
//                     fontSize: 30),
//               ),
//             ),
//             Container(
//               padding: const EdgeInsets.all(10),
//               child: TextField(
//                 controller: controller.emailController,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(20)),
//                   labelText: 'Email',
//                 ),
//               ),
//             ),
//             TextButton(
//               onPressed: () {
//                 Get.toNamed(Routes.LOGIN);
//               },
//               child: const Text('Back to Login'),
//             ),
//             Container(
//                 height: 50,
//                 padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     foregroundColor: Colors.white, backgroundColor: Colors.indigo,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(32.0),
//                     ),
//                   ),
//                   child: const Text('Reset Password'),
//                   onPressed: () =>
//                       controller.resetPassword(controller.emailController.text),
//                 )),
//           ],
//         ),
//       ),
//     );
//   }
// }