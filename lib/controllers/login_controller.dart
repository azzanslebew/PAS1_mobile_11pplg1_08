import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/POST/login_service.dart';

class LoginController extends GetxController {
  final LoginService loginService = LoginService();
  var isLoading = false.obs;
  var loginStatus = ''.obs;
  var token = '6e204d42044a6c113f92da51fac3d24e'.obs;

  Future<void> loginUser(String username, String password) async {
    try {
      isLoading(true);

      final responseData = await loginService.login(username, password);

      if (responseData['status'] == true) {
        token.value = responseData['token'] ?? '';
        loginStatus.value =
            'Login berhasil: ${responseData['message']}\nToken: ${token.value}';

        Get.snackbar(
          'Success',
          'Login successfully!',
          snackPosition: SnackPosition.TOP,
          backgroundColor: const Color(0xff156651),
          duration: 2.seconds,
          colorText: Colors.white,
        );
        Get.offAllNamed('/home');
      } else {
        loginStatus.value = 'Login gagal: ${responseData['message']}';
        Get.snackbar(
          'Error',
          responseData['message'] ?? 'Login gagal.',
          snackPosition: SnackPosition.TOP,
          duration: 2.seconds,
          backgroundColor: const Color(0xff156651),
          colorText: Colors.white,
        );
      }
    } catch (e) {
      loginStatus.value = 'Login gagal: $e';
      Get.snackbar(
        'Error',
        'Terjadi kesalahan: $e',
        snackPosition: SnackPosition.TOP,
        duration: 2.seconds,
        backgroundColor: const Color(0xff156651),
        colorText: Colors.white,
      );
    } finally {
      isLoading(false);
    }
  }
}
