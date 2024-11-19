import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/login_controller.dart';
import '../widgets/my_app_bar.dart';
import '../widgets/my_button.dart';
import '../widgets/my_divider_text.dart';
import '../widgets/my_text.dart';
import '../widgets/my_text_field.dart';

class LoginPage extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: const MyAppBar(
        title: 'Welcome Back!',
        fontSize: 26,
        showIcon: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MyText(
                text:
                    'Enter your username to start shopping and get awesome deals today!',
                textStyle: GoogleFonts.manrope(
                  fontSize: 14,
                  color: const Color(0xff757575),
                ),
              ),
              const SizedBox(height: 30),
              MyTextField(
                controller: usernameController,
                labelText: 'Username',
                prefixIcon: Icons.person,
                isPassword: false,
              ),
              const SizedBox(height: 16),
              MyTextField(
                controller: passwordController,
                labelText: 'Password',
                prefixIcon: Icons.lock,
                isPassword: true,
              ),
              const SizedBox(height: 16),
              MyText(
                  text: 'Forgot your password?',
                  textStyle:
                      GoogleFonts.manrope(color: const Color(0xff156651))),
              const SizedBox(height: 16),
              MyButton(
                category: 'Log In',
                onPressed: () {
                  if (usernameController.text.isEmpty ||
                      passwordController.text.isEmpty) {
                    loginController.loginStatus.value = '';
                    Get.snackbar(
                      'Error',
                      'Username or password cannot be empty',
                      snackPosition: SnackPosition.TOP,
                      backgroundColor: const Color(0xff156651),
                      duration: 1.seconds,
                      colorText: Colors.white,
                    );
                  } else {
                    loginController.loginUser(
                      usernameController.text,
                      passwordController.text,
                    );
                  }
                },
                backgroundColor: const Color(0xff156651),
                textColor: Colors.white,
                borderRadius: 12,
                elevation: 2,
                showBorder: false,
              ),
              const SizedBox(height: 20),
              const MyDivText(
                text: 'OR',
                isThick: true,
                isColored: true,
              ),
              const SizedBox(height: 20),
              MyButton(
                onPressed: () {},
                category: 'Log In with Email',
                backgroundColor: const Color(0xffF5F5F5),
                textColor: const Color(0xff156651),
                borderRadius: 10.0,
                showIcon: true,
                isIconLeft: true,
                showBorder: true,
                icon: Icons.mail,
              ),
              const SizedBox(height: 5),
              MyButton(
                onPressed: () {},
                category: 'Log In with Facebook',
                backgroundColor: const Color(0xffF5F5F5),
                textColor: const Color(0xff156651),
                borderRadius: 10.0,
                showIcon: true,
                isIconLeft: true,
                showBorder: true,
                icon: Icons.facebook,
              ),
              const SizedBox(height: 50),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: GoogleFonts.manrope(
                      color: const Color(0xff404040),
                      fontSize: 14,
                    ),
                    children: [
                      TextSpan(
                        text: 'Register',
                        style: GoogleFonts.manrope(
                          color: const Color(0xff156651),
                          fontSize: 14,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
