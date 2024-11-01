import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});

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
                  'CREATE AN ACCOUNT',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Enter your Name, Email and Password to create a jobspot account',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 30),
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
                const SizedBox(height: 16),
                TextField(
                  controller: controller.passwordController,
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
                    labelText: 'Password',
                    labelStyle: const TextStyle(color: Colors.grey),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: controller.confirmPasswordController,
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
                    labelText: 'Confirm Password',
                    labelStyle: const TextStyle(color: Colors.grey),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 30),
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
                    onPressed: () => controller.register(
                        controller.emailController.text,
                        controller.passwordController.text, 
                        controller.confirmPasswordController.text),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an Account?'),
                    TextButton(
                      child: const Text('login'),
                      onPressed: () {
                        Get.offAllNamed(Routes.LOGIN);
                      },
                    ),
                  ],
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
// import '../controllers/register_controller.dart';

// class RegisterView extends GetView<RegisterController> {
//   const RegisterView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('RegisterView'),
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
//                 'Register Page',
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
//             Container(
//               padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
//               child: TextField(
//                 obscureText: true,
//                 controller: controller.passwordController,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(20)),
//                   labelText: 'Password',
//                 ),
//               ),
//             ),
//             Container(
//                 height: 50,
//                 padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                 child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       foregroundColor: Colors.white, backgroundColor: Colors.indigo,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(32.0),
//                       ),
//                     ),
//                     child: const Text('Register'),
//                     onPressed: () => controller.register(
//                         controller.emailController.text,
//                         controller.passwordController.text))),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Text('Already have an account?'),
//                 TextButton(
//                   child: const Text('Login'),
//                   onPressed: () => Get.back(),
//                 )
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }