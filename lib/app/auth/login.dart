import 'package:flutter/material.dart';
import '../core/app_theme.dart';
import '../core/auth_utls.dart';
import '../widgets/custom_btn.dart';
import '../widgets/custom_text_btn.dart';
import '../widgets/custom_textfield.dart';
import 'regex.dart';
import 'register.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  static const routeName = 'LoginScreen';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController =
      TextEditingController(text: 'a@gmail.com');
  final TextEditingController _passwordController =
      TextEditingController(text: '123456');
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
                Text(
                  'Log In',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primaryLight,
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
                            AuthManager.login(
                              email: _emailController.text,
                              password: _passwordController.text,
                              context: context,
                            );
                            _emailController.clear();
                            _passwordController.clear();
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
                    Navigator.pushReplacementNamed(context, RegisterScreen.routeName);
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
