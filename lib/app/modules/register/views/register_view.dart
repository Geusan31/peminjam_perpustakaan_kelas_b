import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/modules/register/controllers/register_controller.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/routes/app_pages.dart';


class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RegisterView'),
        centerTitle: true,
      ),
      body: Center(
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: controller.nameController,
                  decoration: InputDecoration(hintText: "Masukkan Nama"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "nama tidak boleh kosong";
                    }
                    return null;
                  },
                ),
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
                  controller: controller.telpController,
                  decoration: InputDecoration(hintText: "Masukkan Telp"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "telp tidak boleh kosong";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: controller.alamatController,
                  decoration: InputDecoration(hintText: "Masukkan Alamat"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "alamat tidak boleh kosong";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: controller.passwordController,
                  decoration: InputDecoration(hintText: "Masukkan Password"),
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
                      controller.register();
                    },
                    child: Text("Register"))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Sudah Punya akun? "),
                    GestureDetector(onTap: () {
                      Get.offAllNamed(Routes.LOGIN);
                    },child:Text("Login")),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
