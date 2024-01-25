import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/modules/login/controllers/login_controller.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/routes/app_pages.dart';


class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginView'),
        centerTitle: true,
      ),
      body: Center(
          child: Form(
        key: controller.formKey,
        child: Column(
          children: [
            TextFormField(
              controller: controller.usernameController,
              decoration: InputDecoration(hintText: "Masukkan Username"),
              validator: (value) {
                if (value!.isEmpty) {
                  return "username tidak boleh kosong";
                }
                return null;
              },
            ),
            TextFormField(
              controller: controller.passwordController,
              decoration: InputDecoration(hintText: "Masukkan Password", ),
              obscureText: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return "password tidak boleh kosong";
                }
                return null;
              },
            ),
            Obx(() => controller.loading.value
                ? CircularProgressIndicator()
                : ElevatedButton(
                onPressed: () {
                  controller.login();
                },
                child: Text("Login"))),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Belum Punya akun? "),
                GestureDetector(onTap: () {
                  Get.offAllNamed(Routes.REGISTER);
                },child:Text("Register")),
              ],
            )
          ],
        ),
      )),
    );
  }
}
