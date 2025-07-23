import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'login/screen/login_screen.dart';

void main() {
  runApp(
    GetMaterialApp(home: LoginScreen(), debugShowCheckedModeBanner: false),
  );
}
