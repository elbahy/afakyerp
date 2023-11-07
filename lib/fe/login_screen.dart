import 'package:afakyerp/core/api/api_service.dart';
import 'package:afakyerp/widgets/textfield_custom.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({
    super.key,
  });

  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(
                labelText: 'اسم المستخدم',
                suffixIcon: Icons.person,
                textFieldController: userController),
            const SizedBox(height: 25),
            CustomTextField(
                labelText: 'كلمة المرور',
                suffixIcon: Icons.password,
                textFieldController: passController),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  backgroundColor: Colors.amber,
                  textStyle: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                  foregroundColor: Colors.black),
              child: const Text('تسجيل دخول'),
            )
          ],
        ),
      )),
    );
  }
}
