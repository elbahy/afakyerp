import 'dart:async';

import 'package:afakyerp/features/add_invoice/add_invoice_screen.dart';
import 'package:afakyerp/features/login/cubit/login_cubit.dart';
import 'package:afakyerp/features/login/cubit/login_states.dart';
import 'package:afakyerp/widgets/textfield_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            BlocConsumer<LoginCubit, LoginStates>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return FutureBuilder(
                              future: BlocProvider.of<LoginCubit>(context)
                                  .login(
                                      user: userController.text,
                                      pass: passController.text),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  Timer(const Duration(seconds: 1), () {
                                    Navigator.of(context)
                                        .popAndPushNamed('/addInvoice');
                                    // إغلاق الرسالة تلقائيا بعد ثانية
                                  });
                                  return const AlertDialog(
                                    content: Text('تم تسجيل الدخول بنجاح'),
                                  );
                                } else {
                                  return const Center(
                                      child: CircularProgressIndicator(
                                    color: Colors.black,
                                  ));
                                }
                              });
                        });
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      backgroundColor: Colors.amber,
                      textStyle: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                      foregroundColor: Colors.black),
                  child: const Text('تسجيل دخول'),
                );
              },
            )
          ],
        ),
      )),
    );
  }
}
