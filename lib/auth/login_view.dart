import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loge_in/auth/fireauth.dart';

import 'register_view.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_textFormField.dart';
import '../widgets/custom_button.dart';

// ignore: must_be_immutable
class LoginView extends StatelessWidget {
  LoginView({super.key});

  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(

        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(right: 16, left: 16, top: 42, bottom: 42),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: 'Welcome,',
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(RegisterView());
                              },
                              child: CustomText(
                                text: 'Sign Up',
                                fontSize: 18,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomText(
                          text: 'Sign in to Continue',
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          height: 48,
                        ),
                        CustomTextFormField(
                          title: 'Email',
                          hintText: 'ahmedelsayed@gmail.com',
                          keyboardType: TextInputType.emailAddress,
                          validatorFn: (value) {
                            if (value!.isEmpty) {
                              return 'Email invalid or not found';
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
                            if (value!.isEmpty) {
                              return 'Password is incorrect';
                            }
                            return null;
                          },
                          onSavedFn: (value) {
                           password = value;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomButton(
                          'SIGN IN',
                          () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                            //  fireAuthSignIn(email!, password!);
                              Authent().loginWithEmailAndPassword(email!, password!);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 28,
                ),
                CustomText(
                  text: '-OR-',
                  fontSize: 18,
                  alignment: Alignment.center,
                ),
                const SizedBox(
                  height: 43,
                ),
                CustomButtonSocial(
                  title: 'Sign In with Google',
                  image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMQOt--fUcrj5SANzIF68Oqbz1siTQ8L-dtN0g2no2K-QGUiMqp2auEjHtqiSmxiI_gqw&usqp=CAU',
                  onPressedFn: () {
                    Authent().signInWithGoogleAccount();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomButtonSocial extends StatelessWidget {
  const CustomButtonSocial({
    super.key,
    required this.onPressedFn,
    required this.title,
    required this.image,
  });

  final void Function()? onPressedFn;
  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressedFn,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.network(
              image,
              fit: BoxFit.cover,
              height: 20,
              width: 20,
            ),
            CustomText(
              text: title,
              fontSize: 14,
            ),
            Container(width: 20),
          ],
        ),
      ),
    );
  }
}
