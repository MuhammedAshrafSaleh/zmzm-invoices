import 'package:flutter/material.dart';
import 'package:zmzm_cashes/app/views/home/home.dart';

import '../../core/regex.dart';
import '../../core/theme.dart';
import '../../widget/custom_btn.dart';
import '../../widget/custom_text_btn.dart';
import '../../widget/custom_textfield.dart';
import 'register.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  static const routeName = 'LoginScreen';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 100,
            left: 20,
            right: 20,
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Log In',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primaryColor,
                  ),
                ),
                const Text(
                  'Zmzm Invoices',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      CustomTextFormField(
                        controller: _emailController,
                        text: 'Email',
                        keyboardType: TextInputType.emailAddress,
                        hasIcon: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email address';
                          }
                          if (!RegEx.validateEmail(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30),
                      CustomTextFormField(
                        controller: _passwordController,
                        text: 'Password',
                        hasIcon: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30),
                      CustomBtn(
                        text: 'Login',
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            print(_emailController.text);
                            print(_passwordController.text);
                            _emailController.clear();
                            _passwordController.clear();
                            Navigator.pushNamed(context, HomeScreen.routeName);
                          }
                        },
                      ),
                    ],
                  ),
                ),
                CustomTextButton(
                  text1: 'Don’t have an account?',
                  text2: 'Register Now',
                  onPressed: () {
                    Navigator.pushNamed(context, RegisterScreen.routeName);
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
