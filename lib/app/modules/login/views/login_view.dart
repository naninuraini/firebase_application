import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginController controller = Get.find<LoginController>();
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: SafeArea(
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
                    'WELCOME',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Enter your Email and Password to explore interesting jobs',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    controller: emailController,
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
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
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
                  ),
                  const SizedBox(height: 30),
                  TextButton(
                    onPressed: () {
                      Get.offAllNamed(Routes.RESET_PASSWORD);
                    },
                    child: const Text('Forgot Password'),
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
                      onPressed: () => controller.login(
                          emailController.text, passwordController.text),
                      child: const Text(
                        'Login',
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
                      const Text('Does not have an account?'),
                      TextButton(
                        child: const Text('Register'),
                        onPressed: () {
                          Get.offAllNamed(Routes.REGISTER);
                        },
                      ),
                    ],
                  ),
                ],
              ),
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
// import '../controllers/login_controller.dart';

// class LoginView extends GetView<LoginController> {
//   const LoginView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('LoginView'),
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
//                 'Flutter Login Page',
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
//             TextButton(
//               onPressed: () {
//                 Get.toNamed(Routes.RESET_PASSWORD);
//               },
//               child: const Text('Forgot Password'),
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
//                   child: const Text('Login'),
//                   onPressed: () => controller.login(
//                       controller.emailController.text,
//                       controller.passwordController.text),
//                 )),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Text('Does not have an account?'),
//                 TextButton(
//                   child: const Text('Register'),
//                   onPressed: () {
//                     Get.toNamed(Routes.REGISTER);
//                   },
//                 )
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }