import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zcorp_app_project/feature/login/controller/login_controller.dart';
import 'package:zcorp_app_project/feature/login/screen/login_screen.dart';
import 'package:zcorp_app_project/feature/signup/screen/signup_page.dart';
import 'feature/light/controller/light_controller.dart';

void main() {
  runApp(GetMaterialApp(home: LoginScreen()));
}
