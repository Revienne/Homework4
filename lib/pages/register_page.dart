import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/theme_controller.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _validateForm() {
    if (_formKey.currentState!.validate()) {
      Get.snackbar('Success', 'register'.tr,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'.tr),
        actions: [
          DropdownButton<Locale>(
            value: Get.locale,
            items: const [
              DropdownMenuItem(
                  value: Locale('en', 'US'), child: Text('English')),
              DropdownMenuItem(
                  value: Locale('km', 'KH'), child: Text('ភាសាខ្មែរ')),
            ],
            onChanged: (Locale? locale) {
              if (locale != null) {
                Get.updateLocale(locale);
              }
            },
          ),
          IconButton(
            icon: Icon(Get.find<ThemeController>().isDark.value
                ? Icons.light_mode
                : Icons.dark_mode),
            onPressed: () => Get.find<ThemeController>().toggleTheme(),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'email'.tr,
                  prefixIcon: const Icon(Icons.email),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                validator: (value) {
                  if (value == null ||
                      !value.contains('@') ||
                      !value.contains('.')) {
                    return 'invalid_email'.tr;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'password'.tr,
                  prefixIcon: const Icon(Icons.lock),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                validator: (value) =>
                    value!.isNotEmpty ? null : 'empty_password'.tr,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _validateForm,
                child: Text('register'.tr),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
