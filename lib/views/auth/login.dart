import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monitor/controllers/logincont.dart';
import 'package:monitor/views/auth/signup.dart';
import 'package:monitor/views/pages/home.dart';
import 'package:monitor/widgets/customfield.dart';
import 'package:monitor/widgets/custompass.dart';
import 'package:monitor/widgets/submit.dart';
import 'package:monitor/widgets/textwidget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 120, 30, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[200],
                  ),
                  child: Column(
                    children: [
                      Form(
                        key: controller.key,
                        child: Column(
                          children: [
                            CustomTextFormField(
                              controller: controller.emailController,
                              validate: controller.validateEmail,
                              text: 'Email Address',
                              isPassword: false,
                            ),
                            const SizedBox(height: 20),
                            Obx(
                              () => CustomPasswordFormField(
                                controller: controller.passwordController,
                                validate: controller.validatePassword,
                                text: 'Password',
                                isVisible: controller.isVisible.value,
                                onPressed: controller.changeVisibility,
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 5.0),
                                  child: GestureDetector(
                                      onTap: () {
                                        if (controller
                                            .emailController.text.isEmpty) {
                                          Get.snackbar(
                                              'Error', 'Email can not be empty',
                                              snackPosition:
                                                  SnackPosition.BOTTOM);
                                        } else {}
                                      },
                                      child: const TextWidget(
                                        size: 12,
                                        text: 'Forgot Password?',
                                        bold: false,
                                      )),
                                )
                              ],
                            ),
                            const SizedBox(height: 20),
                            SubmitButton(
                              text: 'LOGIN',
                              ontap: () {
                                // if (controller.key.currentState!.validate()) {
                                //   controller.signInUser(
                                //       email: controller.emailController.text,
                                //       password:
                                //           controller.passwordController.text);
                                // }
                                Get.to(() => const HomePage());
                              },
                              color: Colors.deepPurple,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const TextWidget(
                            size: 12,
                            text: 'Not registered?',
                            bold: false,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => const SignUpPage());
                            },
                            child: const TextWidget(
                              size: 14,
                              text: ' SignUp Now',
                              bold: false,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
