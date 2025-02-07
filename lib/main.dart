import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/theme_controller.dart';
import 'localization/my_localization.dart';
import 'pages/register_page.dart';

void main() {
  Get.put(ThemeController()); 
  runApp(
    Obx(() => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: Get.find<ThemeController>().isDark.value
              ? ThemeMode.dark
              : ThemeMode.light,
          home: const RegisterPage(),
          locale: const Locale('en', 'US'),
          translations: MyLocalization(),
        )),
  );
}
