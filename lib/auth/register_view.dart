import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'fireauth.dart';
import 'login_view.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_textFormField.dart';
import '../widgets/custom_button.dart';

// ignore: must_be_immutable
class RegisterView extends StatelessWidget {
   RegisterView({super.key});

  final _formKey = GlobalKey<FormState>();
  String? name;
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Get.off(LoginView());
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 16, left: 16, top: 22, bottom: 44),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomText(
                        text: 'Sign Up',
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(
                        height: 48,
                      ),
                      CustomTextFormField(
                        title: 'Name',
                        hintText: 'Ahmed Elsayed',
                        validatorFn: (value) {
                          if (value!.isEmpty || value.length < 3) {
                            return 'Please enter valid name.';
                          }
                          return null;
                        },
                        onSavedFn: (value) {
                          name = value;
                        },
                      ),
                      const SizedBox(
                        height: 38,
                      ),
                      CustomTextFormField(
                        title: 'Email',
                        hintText: 'ahmedelsayed@gmail.com',
                        keyboardType: TextInputType.emailAddress,
                        validatorFn: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter valid email address.';
                          }
                          return null;
                        },
                        onSavedFn: (value) {
                            email = value;
                        },
                      ),
                      const SizedBox(
                        height: 38,
                      ),
                      CustomTextFormField(
                        title: 'Password',
                        hintText: '***********',
                        obscureText: true,
                        validatorFn: (value) {
                          if (value!.isEmpty || value.length < 6) {
                            return 'Please enter valid password with at least 6 characters.';
                          }
                          return null;
                        },
                        onSavedFn: (value) {
                           password = value;
                        },
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      CustomButton(
                        'SIGN UP',
                        () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            Authent().createUserWithEmailAndPassword(email!, password!,name!);
                            // fireAuthCreate(email!, password!);
                            // addUser(name! ,email! ,password!);
                             Get.off(LoginView());
                          }
                        },
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
